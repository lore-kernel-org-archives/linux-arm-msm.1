Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578248;
	b=R7Dr/5cDb1lUcGwRvsQDb8GBcMNkww7QxU765+GIj32kUjY0dHG7VLPyiZSLFU1LgjUK
	 vY0BaPjkmvyAiSN4p9mBqrJdQvui0TUTtGwM8h/vxhgaTrujdwdh9dZqBSnWTYwh4w4Wi
	 UCnHrunzS8sDnXK3rDniMBgFb7q5EwuZc7RTJLJb4VrKjR32TQhPibwnH7lJehaeQAUlh
	 MXyF/FaLPqpIIShgVk4fc05lDAkYYQSWVDb6ldFzNNTBBR3W6TcSKY88VzG3NkktFwUBt
	 kQpoFgXtq9auwCee+dXiwSwQv4aQCV6X1dqpGBuerEan3BDPfPor2VXqHhMi8ocRZ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
	b=jyoXLFGHudjKbPEkZsmrmp2HBerhcrC2fMN10hgXuaeaxgw74EgrYqqizpVrS+Xfhp5Y
	 i8bUUwKP7os4fPy8yK1yYqo5iH0f0YwavYia0pcxJRGiWYP4t7eES4dn5xVvtwwVW0Bki
	 681uJ1yRgUFSdwii12iGdYZeZRVhyGvhrG4U0iGmG3FHCFiqQeJmMZQR8c/+XAe8OJY5n
	 DB0VsvRTR5Usm43sTl0pnzJWAywp24GqnE3z3EWrqk/rjSNyCjA5YgIaPz/T9IovKdkQZ
	 bfV2ZUiQNhJdHoKnNX4o0t6YMxA10Q8I5npCJPmYcVltyEBNXWMFtRZzoyBbOFI7Dlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE715606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE715606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYJnCPDC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso28446735e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578246; x=1796183046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=yYJnCPDCwX2z7GW0KEzZrs4pq2lhpcKSCvfZ7Jxb5FFkSXbRD/DKL3imKFKjuozlx0
         PjoGDpUiZBJMXXrwVVv65xOZtRHEQr7Mp03mrKt/vzdLw8MJ+WFu49aJ+T/d37cNt9+0
         iyyRKW9IcXrsAWM7+n7HO24S6uBagb+7QbJE1odzSFgeGL6gzPo32tZiTXSkOPZdF8SQ
         lZXlXY9dCMKGWuXQqoNmMXGhc5CIK0sJZ4AfyM/TJgjzKVwfBbHcTRqrhathFIflxn4I
         m8Ek+pAdgoCuX2AZC4asCQrNaa4et/XMHCzHRzgNV/fFDwwF//9V/YDf75TCkIiiiCiD
         PQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578246; x=1796183046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=TSeSEQ02sjK1jTJK+qW8BRpfWTlwMSPFN8yrmbbTJXQiZHULqZVHAdYYmiCzXJqA36
         0lS+ByDH0+LQHKcHSXRusEZ2yGI1HjkZefbMv4yXOydTzvhW+qUHkFDq5FDlqC+pZBfJ
         Ku7UaDVNJ7jed4TZV8FPuV9/veHa7xWHkO15emhAu07TvsioC/AuqBLD1YspI61ANXyr
         JR/FvKkwvCN+1qd0Kdsi/hBcF3Uhza1rnO60Qe9UILeC050yDk779xyPyCyNk4MTQTSo
         PF+yIchahDbCZTOudFK1DW+pna0BGPwGfLvQkgLT3ciKoQzF7e1Hj+hIipL0Y0x8PlmR
         ts3g==
X-Gm-Message-State: APuU4Z+zL5HgUJx1y0yF30LPv8qBwMZHs0Ue9SRg/Myc23pj/8BRhd1J
	jbnQAl68o8qacPi8IJlQJXDtDFxhiWEuXDXsmh7tvk1lSclbHAgTcTtR
X-Gm-Gg: AZFdTZe9byqvkzPCLCnw5Z8yGN7M7dcdsL7vFMazo97cLArdIW4gpxXTyn7H74YT55b
	sl6/qytiqaxVjE+TOStye4/guzhm6+Ffuh+qgW1+lVMjAkrkuetPtJe51BH7JXkVO9iWJiV7dSJ
	z0E5zsC9X1tsBn8flnkFPpgJdhx/UAzGutk+qwP0qmTiWUzsSIQ8hd+ciTA+DEcZDPnyEID3dPJ
	Kghn2GwpGD1sBRikcCISeZu0QRZ3tZajyz/axyMOYOF/px5T4j1tLZq4Qqauz7j7S9yF93cqQlL
	g4T5yBDMTkQNY1Kda5t71A7AEaonsvvOalM6oYZwDPo/ctAUek7ShFWqvPwws/48TkRcN9qzHV+
	kBlLD6PkpK0rQCA2pSiX0K6Ux2xoaqVLw3kuUYs73c3ZIwXM20bmmrZCNwZ9nAb50kAzWkciejW
	D583JfuIjMnmyNHDFQ56XYGsrbEa8wLCLzaGmY4ajZQxvalLX+MvkaiLANN8B68/meKgLnfRcMj
	Ei9fcWahEhdgLQxlaxWj18KCYmwBYK4ID3r6syLTOyEPPciqQku2ahNxq9+aqaycL3017vXXU9G
	6F3eS4B5PyYaQ9+wSQlgRQwIrfMRGA2YkGuItA==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr345180345e9.32.1795578246276;
        Tue, 24 Nov 2026 19:44:06 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:03 +0000
Subject: [PATCH v3 07/14] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
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
Message-Id: <20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1101;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QhWGZ2nDLik/AVSmlPnUVJyIcZFTcrhPWPSMCAukIeM=;
 b=6AJhs5Z6f/n9pNkfdd62Z4MaOrVcciMknCqzjBkVEi354abH/HUGDZk9PowwAyDuxfg/8VsUi
 qlXYQzCUXxLD5rZQ1VTRb8Bh7LUtJE1bI5xcjBVOagvzX82tdchlf+N
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the UFS host controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0

