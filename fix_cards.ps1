$file = 'c:\Users\ramcs\OneDrive\Desktop\car\index.html'
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Find start marker and end marker
$startMarker = '    <div class="service-container">'
$endMarker = '  </section>'

$startIdx = $content.IndexOf($startMarker)
# Find the </section> that immediately follows the service-container
$endIdx = $content.IndexOf($endMarker, $startIdx)
$endIdx2 = $endIdx + $endMarker.Length

$newBlock = @'
    <div class="service-container">

      <!-- 1. EXPRESS DETAIL -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 1,999</span>
              <h3>Express<br>Detail</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">A swift yet thorough refresh for your vehicle &mdash; perfect for regular upkeep.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Hand wash &amp; wheel clean</li>
              <li>Premium 2&ndash;4 week wax</li>
              <li>Tire dressing (satin finish)</li>
              <li>Air blow cracks &amp; door jams</li>
              <li>Interior vacuum &amp; wipe-down</li>
              <li>Window cleaning inside &amp; out</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

      <!-- 2. FULL DETAIL -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 2,999</span>
              <h3>Full<br>Detail</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">The complete alchemy treatment &mdash; every inch of your car brought back to life.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Hand wash with premium shampoo</li>
              <li>Premium quality wax (2&ndash;4 weeks)</li>
              <li>All interior surfaces scrubbed</li>
              <li>Deep vacuum: carpets, seats, mats</li>
              <li>Engine bay light clean</li>
              <li>Leather conditioning treatment</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

      <!-- 3. DECONTAMINATION -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 3,999</span>
              <h3>Decontamination</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">Deep science for stubborn contaminants &mdash; iron, tar, water spots eliminated.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Clay bar &amp; iron treatment</li>
              <li>Water spot &amp; tar removal</li>
              <li>Leather seat treatment</li>
              <li>Rubber floor mat deep clean</li>
              <li>Thorough vacuuming</li>
              <li>Paint surface prep coat</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

      <!-- 4. CERAMIC COATING -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 9,999</span>
              <h3>Ceramic<br>Coating</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">Long-lasting nano-ceramic protection &mdash; repels water, UV, and contamination for years.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Full paint decontamination</li>
              <li>Machine paint correction</li>
              <li>Professional ceramic application</li>
              <li>2&ndash;5 year protection warranty</li>
              <li>Hydrophobic finish</li>
              <li>UV &amp; scratch resistance</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

      <!-- 5. PAINT CORRECTION -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 5,999</span>
              <h3>Paint<br>Correction</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">Swirl marks, scratches, and oxidation dissolved with machine polishing mastery.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Single or dual-stage polishing</li>
              <li>Swirl mark elimination</li>
              <li>Light scratch removal</li>
              <li>Paint depth measurement</li>
              <li>Finishing polish</li>
              <li>Paint sealant application</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

      <!-- 6. PPF WRAP -->
      <div class="service-card">
        <div class="card-inner">
          <div class="card-front">
            <div class="card-front-top">
              <span class="badge">STARTING AT &#8377; 14,999</span>
              <h3>PPF<br>Wrap</h3>
            </div>
            <div class="card-front-bottom">
              <p class="subtitle">Paint Protection Film &mdash; invisible armour against stone chips, bugs, and road debris.</p>
              <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
            </div>
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <ul class="feature-list">
              <li>Partial or full body coverage</li>
              <li>Self-healing film technology</li>
              <li>10-year warranty coverage</li>
              <li>High-clarity optical finish</li>
              <li>Pre-cut precision application</li>
              <li>Post-install ceramic top coat</li>
            </ul>
            <p class="card-back-hint">Move away to flip back &#8617;</p>
          </div>
        </div>
      </div>

    </div>
  </section>
'@

$newContent = $content.Substring(0, $startIdx) + $newBlock + $content.Substring($endIdx2)
[System.IO.File]::WriteAllText($file, $newContent, [System.Text.UTF8Encoding]::new($false))
Write-Host "Done. File updated successfully."
