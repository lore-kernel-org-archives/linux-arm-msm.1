Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184481;
	b=WWQXm/ZUQAdSy5KNx+lghfOMd/uBJXcgZwG2MPHRm6cZzLL1ci4s3drCJ0hLNGIYmfN+
	 cyvg3HzK8P6da/DmfZuai3ye88Z5/LJVQDWb6dj4wPk2QRTBlmXMlkkXoHAg5ltzCQd/j
	 87zbsEdgSZQgep/FsrM0eDsenonEWucqaHK+qaAzvzhEjnpT2D05dVdbIQb8xGrRXF151
	 Z/OGEsEXlr0sbfy/5QCznNASG86Ilm0ZAImtJ8YWFVpp0KKN5/9XXGVvlmQPBnvruSGlD
	 ztaLAaQOVttzlI43eXWpkXrng4yVouH27Bq8e20BIVKJRDOkyN+s9FcB/x0r4DPexrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=VBFa/drlCisGUoLpc34GVykGG4EoVatzbSZd9sb5avdbp5z5bCxM9Dn4Omi5vOxdDT7J
	 gy36P4H4DDVIljz15Jv2VOfXJPPbTZWJoQGLtcVWc9XXarrqjpznlwwIX58CHNJCRpNnl
	 woGnPkukf6GZNqs1Ql4HyYJ6Pb50ub8rGOMDmm5jCBB6BX2TLzBq+9JPPzaePAJXADKfO
	 sa3oBPj4fNj8xw6TgZj7IKfJZoSjfkh6X8CV0M3YeV7YYZhpVxmgSaVJPHDb+219k0y1B
	 ygB3+ydIsL6qZQAQCJpzmpX3FFhXlDUEKN/TxPuTuiAdiGsWd2Xl+4RHMlOf6Fc5H5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F04606D808
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F04606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVXS0Dfp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so236626f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=IVXS0DfpUIsNMmmlCVLQc/sr3m1dEoc2PxYn9Q1ZBDZgge7WUtw+jdTyqhCup5beuX
         p5UkKtqsdQor407ZN5+sThyv2nEYmcDa0uUa+CnKgMYC7zlI6qui62evwV2DL9VYinBy
         BarYqmMFrc3QEZTIlC8ssJP3XT4AbNHEFJZW9AzKMaUXkbZAhWMFSvOd7SRW3KD8cBll
         drhaytrMXaHy1ToVY72wpbCvSuNZPazRJo4cICaGRiht28G8IVeEueDOvEoNfrZLf8pw
         YGCplgziHwLWFFjwnfizo2aTCI9Yr266yhB2sLiV1K7bPAt2DOuj7ztQV7B0vgLaulZy
         apqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=bVfvrijjz+p8hT4S4FX2d0seO8RGjwpmiknD2mDZnGgocuFya2tg8KK5DFv/HJKnCB
         Xl+fLhNwC/SauhS7D4VQj1ref1yF1q1YEG00U/yvM93Pe0CsN9zuUWIfXghSiFxVATA2
         U27TMkVUa+Nt+iUa1/gQatKF0u486YbgfyvnRRKhb0TNfC0q9mT+jzBl3Xq2Q+RRvsfJ
         Wjau0wEYnLtd87GqIWNkuxxIjdA/8wWfu5zdNvR3AhkfoSiQOu531GfXiV340cdwAmXE
         zQfUjW+BgSzpZPYfy+c3BGMg7mB8UmwLojvM5sXiUVYl6amdGnfMk7/bWsHP+qiQ3Nxb
         P2Pw==
X-Gm-Message-State: APuU4Z8Em5n4oT+jJS/iE/2fI0JnQWwZGsFTQ3wG8x7LgK6Yen0GV81i
	bK4uxBxNOchgvCEuwEKkuZFfYB7XhpfyVrQSYHj0Hv0P7i+3OlSmtssQ
X-Gm-Gg: AYBFou1EfH8q8Q4ojrU0tiBjd/qXbrPrMeIo5Sc+leTZQq+/NRqyvlnsBDw7ljYDAwn
	W2RSXEjjEQVv3GgjKpb+lD5P19fkNP1h89w04eraMVVmKVeU+HL7dq0czH0HyGGRN37N+7Qj7Vo
	dHWanY7XulvE+3HHqubHjL505m9vAkjEyCHMWALsOFffG4i53zWoAKzxdDfrZI/iwCQqDZjKGhb
	G0gJOBahvGOWNFWeAY227hSSU5EgiVAiPmcJc06hDHyOVMG16d97H7b2Tr3bINX9mCP9oSj0b6s
	J+szPyLpu8IZGab30WAm03ybk1qmEgxRx+uw5P9Fa1Xxr3JNZRTukUCo9zm4e/FjUNu2DqIRYmn
	LzjWdO6RiWkzPw0qCvqEskFPm6a/CLwTW8RKw/bhCSDdYernUNKuEYIPcZHb+Uai+Oielddf5Lo
	JYfKpvIpH8Dh8Ubrly8Qrw+mnB4rFE/Vt2KfhZ0APQZxAf8OSwcmyzNmc3r70BHvm19+DLHzxnR
	qf1+YVZopr2BqTIvPctfFjTDOh6y7o5PEUYeBAkF5zzIL7g1VwR/6teyBX6/sC9ZTCoAaNdOklz
	IfN9MSEL4LsXmCU227zgw5Pj3xKSkPPkZBEVo4qw
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
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
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
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

