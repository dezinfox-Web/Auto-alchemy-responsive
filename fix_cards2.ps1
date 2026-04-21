$file = 'c:\Users\ramcs\OneDrive\Desktop\car\index.html'
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$startMarker = '    <div class="service-container">'
$endMarker   = '  </section>'

$startIdx = $content.IndexOf($startMarker)
$endIdx   = $content.IndexOf($endMarker, $startIdx)
$endIdx2  = $endIdx + $endMarker.Length

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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">A swift yet thorough refresh &mdash; perfect for regular upkeep.</p>
            <ul class="feature-list">
              <li>Hand wash &amp; wheel clean</li>
              <li>Premium 2&ndash;4 week wax</li>
              <li>Tire dressing (satin finish)</li>
              <li>Air blow cracks &amp; door jams</li>
              <li>Interior vacuum &amp; wipe-down</li>
              <li>Window cleaning inside &amp; out</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">Complete alchemy treatment &mdash; every inch brought back to life.</p>
            <ul class="feature-list">
              <li>Hand wash with premium shampoo</li>
              <li>Premium quality wax (2&ndash;4 weeks)</li>
              <li>All interior surfaces scrubbed</li>
              <li>Deep vacuum: carpets, seats, mats</li>
              <li>Engine bay light clean</li>
              <li>Leather conditioning treatment</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">Iron, tar, water spots eliminated with deep science.</p>
            <ul class="feature-list">
              <li>Clay bar &amp; iron treatment</li>
              <li>Water spot &amp; tar removal</li>
              <li>Leather seat treatment</li>
              <li>Rubber floor mat deep clean</li>
              <li>Thorough vacuuming</li>
              <li>Paint surface prep coat</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">Nano-ceramic protection &mdash; repels water, UV &amp; contamination for years.</p>
            <ul class="feature-list">
              <li>Full paint decontamination</li>
              <li>Machine paint correction</li>
              <li>Professional ceramic application</li>
              <li>2&ndash;5 year protection warranty</li>
              <li>Hydrophobic finish</li>
              <li>UV &amp; scratch resistance</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">Swirl marks, scratches &amp; oxidation dissolved with machine polishing.</p>
            <ul class="feature-list">
              <li>Single or dual-stage polishing</li>
              <li>Swirl mark elimination</li>
              <li>Light scratch removal</li>
              <li>Paint depth measurement</li>
              <li>Finishing polish</li>
              <li>Paint sealant application</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
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
          </div>
          <div class="card-back">
            <div class="card-back-title">What's Included</div>
            <p class="subtitle" style="margin-bottom:8px;">Invisible armour against stone chips, bugs and road debris.</p>
            <ul class="feature-list">
              <li>Partial or full body coverage</li>
              <li>Self-healing film technology</li>
              <li>10-year warranty coverage</li>
              <li>High-clarity optical finish</li>
              <li>Pre-cut precision application</li>
              <li>Post-install ceramic top coat</li>
            </ul>
            <button class="btn-service-book" type="button" onclick="location.href='#contact'">Book This Package</button>
          </div>
        </div>
      </div>

    </div>
  </section>
'@

$newContent = $content.Substring(0, $startIdx) + $newBlock + $content.Substring($endIdx2)
[System.IO.File]::WriteAllText($file, $newContent, [System.Text.UTF8Encoding]::new($false))
Write-Host "Done. Cards updated — p tag and button moved to back face."
