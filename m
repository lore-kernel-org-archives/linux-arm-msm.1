Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864457;
	b=rt4VemKRoB8oCW11XrDaxM7WPuWbWaGa8TcuO6JwEfh+GF9mwGW6DWiXYUPn7Fn4CnFf
	 YjEA5qJX8QoJ8uq6du99hgLLu0fCiDD4V0RPsNLcbYTtRhWMsk9VGRQ/m6dyBptcY3Yx6
	 dfzkvtNmhBf1zzLVmdplmrj0BW6OboVmwLohEV8ktJwfVDTztm+fhpFg7TsREGLGqpVR7
	 U+D3NyC+Z/T8/0PQUEqUGheymh5QPEH31ncCp5Z0jyAEftIVmmDrq/RGzKcnj9Lwe6OrO
	 4RLGMj0QVG7lrSA8GOvEEXlu57EGgypr3zKX/CRXdzYqY8oZY9OaGs+eBjHly1hnomA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=fbi7goBTjaylBIYVr3jOo0IPY8H6c0xaCXph2e281lf5jNt+XlR4S4pcgQnvGIwOGAUG
	 zOMDq5mQWTVUyMqXU9HGFJLHUun7iyaTb2qMjRRz+lKm/Q6XpMJUouhajazDeV6JLQ9oZ
	 icaiUgRaE5yRhtmpzq2SMg6UFn9i11lgRQM7EW+p2fvmZrtrY08WCxJnBY9S10Y74sLbc
	 vMPyIT6+BbguSQPfSo3RuLw5AtbuAUB19djiha1B31DbKkLe4Enl2UXWSMAd3bbVCgiVG
	 o52DoP4oeMbujHX1OBFmWxJcGbPu10Ii+zrRo2hE9e/RIuLn49QBgeUPg/mG1f3UV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE45606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE45606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3551458f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864456; x=1795469256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=aEwrHomrXoLkAiILddo3V8DFgxCuIXh9nv9z9CGp99Mvv9q7rqS8WWfJjEVZyPKHzl
         BJcrzkqstHqVy4gz1/y4oTWYkRx+2g14yun07x+dBnVAXWbxJ6Pi8XR06lfkxtBvqCY9
         iLfFme7fheT+0AavzMAdfuk0LNIbBb4A/fuWyckPSLx8IQoPwrMmA2E7Ut++Patm8fWZ
         5Z3yyawCVkfdeHckJNnYoaWNHRgUbs68NL4nZXkxamHwG2zmOimO4uoTqxyi0KJ8H74v
         KgRMh5LPcsoko2D3/7aPeGtRlw0wksD9UiL+6PyQMe8GGRsHDiMrNoZmXU6ZdSAHjYHb
         hHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864456; x=1795469256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=EIoBAuSugmBztBVnxs0dXbpEp1aXHdUHjfkprR088hL8usnEa4Tb/yogWWC1gc7LJg
         cxuhEnSzjrgwV8BuQsVovyAhuauD4EGYbwiD06vTrsAlZg+COBCxauHgXFyO6uH6XAfw
         COhqvxy4Tz+4ORXBUcmggqOeCu0FeQ8DOCzUJD7VbT2iAFlKDrVO1aJv81hYMNsphf7J
         9JIV9OBvNuE8jGZhchj7zaIBwg72o6xnrnDTfoi6wOhz8e6EYekPtssvhxgqTgwvd8jR
         iLTOiLlV0KjkRCPvnn+Moa/94gm5Meg6wOMqFlAVnQT/WoaPLBDJUQxE9F6RKBWllfS3
         u8Rg==
X-Gm-Message-State: APuU4Z+3flO9WC6WRSz68mxGUP1+oH+Etr2PR3pUZTrxAD/DX1MK/LSa
	tlg/wQr1l2wudo4xH5SJNxcGrIHEuqW57dqzNDOXJThjCSpQFwcmIj7m
X-Gm-Gg: AZFdTZc5uXY2VBNXs5ZU1PXidJD5nED0rTHBMS7U+v5iG+eA9vVC/RXzXR151oI0tHq
	ELG1R1Of52tm6j3CfneRQiEDsl/cGePuwMpj649HBh/uaxo4TPXg8Qf+rDZtQv96Q4Yd7IZc1fV
	+/IE3OXd/ckwhAaYlFWzrKRXy/3f6sLyahNExu/fBj8wzTvn6ZAYkq5kpiQn5lJV1Z5JPqgUCHE
	RpJxR1ObcfOtxC0kDvIkVTFVD29Cbi4rR354u32ZAEgKHDo01PAzEGuwUZlmbc/I26MRIrOx0Lm
	0j661IYuvmhiJNaV1HSnYN7wRDvI+Q2OynQ00bu1rgrdsHEi4ybI3JR41ZXHH2eH6LtPX2E4/lJ
	j1+agLU/D2mYkMHK/Xl33JxjFKt/bwRnwbmebGrBNU1ei8HqRzY3wuiXDj3tCPY1m18jV57gPIm
	ggOXF4H6yU9CFCOaY7teOv+ykmMCMs4piU29JMdoScdCEUOpDm9U3fV8VIbj+ZpYsCg49C6CmnR
	Ia8DBPMVdHWD2geT4xFP18QpgYy4utxYY7RP25lO+r/wf29GQuPQOL0bRspUl1SwPRYJKV6er+e
	CLiqUWL9MHnvVesxw/PAJIetdx242/K8CP9gnawK
X-Received: by 2002:a05:6000:25ee:b0:490:b23b:802d with SMTP id ffacd0b85a97d-49c71d475ddmr22315194f8f.37.1794864455894;
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:26 +0000
Subject: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=9cBm/5Mi8IeF1ejOwJZWQD4SfyJ7BWDjVcE5y5kBsTodKh6u91I9h5To2Rc8ArYF4KPYJAO96
 griT0U/fTv6BDQooM53jxYIwB3vuzMj024ajCLGGuHNM9Pf4WE6Noed
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

