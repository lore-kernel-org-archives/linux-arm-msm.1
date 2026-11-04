Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778420;
	b=lgFUA3qtCeSCLkKdEOFHWp3R6mj+Q6DS5UVfFSXS1q8e5Vey9qBwp8g0eqYtYMnHUM8a
	 JpE9A0Y6IxOB+0ithSEURaTT5MJbikBoX2QzaDzRwacIKBkYv/he44IeOuSijPB+n5QRN
	 Kl4XbL0zQ8zBYqbvAhNRnGE26onAGN+sYrq5TMXSIjRMDddHATZpJwp6iiTwtRDpBkHKL
	 b5jw2bwQTds/fVIzb5+t7sW1gxVIeYVUsRFPL6/VNfa3n/qsrVHHtceqNA8IP8Q/7xh1C
	 WSFU1mNwyCMJtLwMEMiamfSlXdj62wIhXqRU9V48Z3+y5nQP75pzHZr2GEW1NU/p3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=vJskO2J6Dw6H1CV4knSTEMUUCANN6s9w4wZvnVjZrQuMND9VOhIolyYxv3lMBlOsw3c9
	 S8rgzAG6DjPCYfDHslpjfrmx8b3St4Yay/ObbVzUsYgOcaKNpFoA9ljkaB2eo/DK/+7dj
	 RAOCj7VQcBjdvcidJ2gdTgR+OAALfUEhGj46HuIxIqa4NR9MKqTJa+18/GC96G5gNoVGK
	 UpJygpr9oimjlbt1v438s1/gpJiTwxx0z6kydFvJNV5J4aWEw6c7ApaM3LKd7LAW/M6+F
	 ATOwxWbP3LSvb7Mljt7b2R5vp2AiJFDIWB8qo7A05jQv/fp3vll1D3QhlQPerZEdBIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86C606D823
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA86C606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso676177eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778419; x=1794383219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=jKoYC0YrzN9VC1u9oq90fiiO2uDEAFoopwC5u/qAKYEgn3ytKayoWaV656V4el59KV
         RxmBVUsaO4YpnBBMPc7Wq5/z9Bdzd924jqwio3tKwn4y33OTEWoyqSyr5RyF303cgIcF
         H9dulUwkrVq/a0E0x6cbEemNYVggGVPs0EAFkqaY9DjIfhQF+Uj5DjIYcIh83FhYnbX2
         +Du8knaOHX6vQtFGpekj6/kSlwty8VrFjXTPPtmeD7DbunqHfQCNr+BstZO9nDzMmITB
         m0EtAvhzfY5zVt7+QMIFpO0PZWHuZyZkeHjDTa6Y3Dh/vc6Z1rQTUiyUef/M3AgXddaI
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778419; x=1794383219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=lm7Uyf5yWmlsSVrq6GSL4fUtDNwAdJixNgLEjp7v8DeJ+ZuObhRp36tYZLxFSIV/VR
         z/IXlZvk05yXlfJ32wbalueJL1VmU/K7fgXdyKoIG5gVlYEmA+UY0jVM2GV+NE7GBnH4
         gZbFIioB0Yxtv3t5qxUGYFomTStcnYvjx+TInQOjMtPl08MIP8mgp8+DvkbrWUMzJSQK
         AFUO3b63mgBPcyTDEN8ALsbEyhBiXMOt36uidblCrgykZuBfeNBsSQf6uNlyjNTBPj4W
         MgjyY07FfgCnC5UZ1kXbhwoGnaRJ36bCSPuiOBmjjhIWVCPKTOSxoWdoyKGQl++Tp+OM
         THGw==
X-Gm-Message-State: APuU4Z984gVAf9nLV01sMvnZKTmoTHQIO93emUzQ+ku376Vy5g5FDJQa
	6kWofKTve/MS9DI3ljxtyDRyXg1hnRfqQJtnWaMewfC2Q3C2MWtQoqX4
X-Gm-Gg: AYBFou2qKK9kK+L7NFRMn9UWsslb8qQfeSgtHGd9drgzPbI7rm9io/n7TyTpGJac7li
	qtXqk2YvNUHZ8pU8dEedFpqmmNUxzTmYEBVEBM5fAbDOEMNYJJAONus1qnotiWvo8qz8+O114Ey
	hkGzlY0nLFOKiww/mriS0jb5GWVxBi+zQgoVE8zvtIA/llXsV//kKpe2Jhh4yEm/y2/ILQOWzPm
	gO8PEgzsLFNT5MXXxocKZSSalTN8FDQAJLCfkpkLLIIOCds7nOmnpmCE4B+X8wnrWALfw2mMH3h
	UGGqGh4Hr5/J32zgjqYfLo0fpp97IFGzU1gBbxNPjb7UC9r0txzZNs9AQ38WGDo+SLCwTKf0MH4
	ggT5xC5LmPyX09hqLIzOj5gQl+wShqEhu3TWiWMzdpC/Wtq0MZMa0YVozbZrqWomXOQti5QQzoa
	tuUkqKWRVoEYtEfeq1u3TuY/x6w52D+K2NG8vJhJAOCJ06F4olBObzLwQeRTmGt+idK/YPsoCw/
	WJLmoUkU24adUkrTa/L53AHNzBHi6grHRDuTuNWsQmHGBd19w/bDES9O229ee3hc+FqUO2KhV0E
	Xo+9mzylwk3oWBJv2ixgLNSw4bK5jj/2fmTRrR0BRPS3SHl58GJbra44/bbvByICot6aDHVatrT
	Y1zaXUA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr24748355eec.29.1793778418484;
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:07 +0000
Subject: [PATCH v12 4/6] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-master-v12-4-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=WKZd2fnmwMJZhaG92c4eTNHvDKdlRwAx2VMbZDZotKHNrMZIh4MVUi10aoDcVp/SN2N/9Gfpx
 TK983WV69hDAxRUjkumKjpFlxJY8oJfvTjwndQDKjm1+IJssrvs3fZc
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

