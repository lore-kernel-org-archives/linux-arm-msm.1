Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184436;
	b=rAd62+sRUOTQindVn4PEPxbXemvT7dMFo81g+/eeLQbI/ktzXaQTUtQyhmqsC+3MPWdg
	 90cAGajRqjQxY5EBnDSzqKhOHj8Cj+t2pHgW9KM6X091wp7NjSMrNvztkLCXTFQiDOBfa
	 c7HLPEp7OasSb7msAzZlKmU5vD4CMiZI5x8dO/c3x1+MiTElcSox976O/evgAd+rUWJTI
	 8ZZuXyPMFGzIqEzuFJROU7De+EYXgxFx13tTM22JT5q3kPbRVP8n6pTPgxFCWSw1tGXXk
	 6vWyQvKUWlRRlcJgbdRK8yDhhJm0Zt9M7AdUdrIWq3r49qZ6DR7vuXYstFy0mNZtkfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
	b=5Tn4TPAWKEyWZC+aLZBbVZsxjGR3Su+KbdbNJfqWHSM9LY+6mLZ9D45xQWXXWd9Hhkmx
	 I0IM1mVyT6KfnUDO61ziFJN/MO+wLg9J3XgZt86En/ne9e4Hsv12LMYAuHNGgwxfBGTBP
	 hwphiFLM2uUxh1MhUAowwNkJR6iGuqVKjAIlYnlM5ypndghWwWCWgIfCqqh+QcD5M51WK
	 p+fsegLh1cG2XDjcWnSffH0J2Zi/8vhrd5cNysJHffmWafuNruiTct/eCg2nYzJTUwpqO
	 g7lzLCthxzwbQgh1bDM5upCbF9YwyUZRQUuYJFFxEnEzehXsFSkFSvoBEHzyc8zeu1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00272606D817
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00272606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjJzEiWq
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490a0e72588so164356f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184434; x=1794789234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=EjJzEiWqX7bP8p2RpKx0A8Mw4VIgcyhMxrNGNGYks9jT5K7ErZactzYCM9t6cwd4kq
         HaawBIqhzJIoLY4VKt7M7axDUH3ltzAQECL2DA4uwdXfdrRmzhjFbqCwUEKRsgMmA3OT
         yUx4/q4gfrM7qxWKUVkUiMy+1fv7O8bhhnA2B0BUCSLouXNRGcMKyshx7XYeRBPj5cMQ
         wqd9SPL1tAWpz/KhUuAGxUxS4NdfwwA1C8dkrWO405Sx1TUg/iTb9/AsEtLF0Uiqhn/2
         2FoNSTstnuusd6jY9eQoW6qa0bQaccSOIzfX/PXknfF9DEqb996bbOcC6TQtKxYLJM+a
         m8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184434; x=1794789234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3VvGqgW7w89m51V5OtlQCJq1vHDswwHimQMB9pEHTM=;
        b=23q6aG5+WWeVDCwYicoq2da8dQNI+X44KsvQdKRx1Dj3ClGlbfyt/AmbegLzqxMmI7
         VLln3oCQOOBRAmLRa6aAccqBlrRUnln0fmAcGmv48/h16Y2xaJEXgO6161tY2kXVIoET
         EAQI3jF5fT0nRIxzcVy/jYFlBY2/apc09v580+mq60DnDdA9hmShPa16SnU/oqUMeZTO
         Kvxxogifh/paN6RFfUnisu/cqW3uok3XLcKqXqNM3fNOSTY+cKR5IDsAXc19ZIUTFhrJ
         9aP/TyCDJT/MVaeD4DtM9PuKuAmy85klEHizT4pAc6Hq9sAKSRX7Tzq/A+EUcuaX8xLP
         +sgw==
X-Gm-Message-State: APuU4Z+6qMX3u1Hxj7/DoQlxYVLaxo1zjHudt4vjUKB/pPJXKnEruJfz
	Vq6liOrWbFP5ZIXwsv0lB2gbMmXZCNzciwEtB+Fsvsix43ACL73FZA8K
X-Gm-Gg: AYBFou3L7r1I45pmTvGPLes7G2kRqjHir47kZDostT+QMvB8RNN970tsa+v0cWvkwdM
	fdp/5Vcj4d2O1Dqy3VOWkRIiXw6d1nxkFj/yLcqIaAamI4XzIxqT93idVbnkPY8oH2w7ahvruig
	T4xJfdX2hgTgJinWfn+fL0yHtxt1Buerb8C6IUnChX5PvaXhv9PoJU0Xl9ta/9BGjuiM7JEjxVl
	Iaut495oLlismGv1t/ioJIpIAfwLCFLMi5F9GKrdbon+xtJ0xPW0wosJ7fHn2wQQhGS43iOF6wA
	g6Src/9qUnd7K7MMVk+ExcavqwUez79SOktd3Z3XqkykNtqMM0/JnvcaT/ckMk7oNv+CWmarL9s
	m2J2fMFIAglfJClUs2Ituh966PJiI0Afwh70ehNpHQsu74kcWgjkoqqj4nhpu+wch+YF0GxChAY
	rkAI9OgHe2ayEtbYzWk+vXrvbp5saxHCplGm/U4mZV8jvidxc7FtYNber1Eu24NuSU07uiXHZEY
	FG+y7tZdqgU4GLFO0cbWOEIOFP4BIO5MOTZArVE05QEF2GdWPET5PUL9wTxBsc24QwtPl60Kbgh
	7tFqfrr0sk1YnkKlnZLp3PzLBN/9HbsjuxviBSV03A==
X-Received: by 2002:a05:6000:186c:b0:493:2eb8:e7fb with SMTP id ffacd0b85a97d-495856e15f7mr5379354f8f.41.1794184434351;
        Sun, 08 Nov 2026 16:33:54 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:18 +0000
Subject: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
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
Message-Id: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1112;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ePrzoruUVeLDRq3OCS+DiCl1d/Uk3kZuK6w1BATsFKY=;
 b=pH81WehGSEFzi7T7LS+ShwXYAfu5lsev7imaA1JaeNifItRSFvMkK3a/y3Fr2K8IwuXgQfeAv
 1F1xnpR5tNxDdiiDmSxt0TVIqWh9HxtwfbMTz8uhxpsozlK3LlCAs7D
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SMMU-500 on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..925afa8cca8d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,halliday-smmu-500
               - qcom,hawi-smmu-500
               - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
@@ -629,6 +630,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,halliday-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.55.0

