Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864483;
	b=K3lEO6j9Y0+yhDjt8GFFlYafLrFG6GEZ/dOKf1pTz1/tECnm7g/IR4Rrie3uap8Z3gvj
	 XAJBxNla5F1QK9vGTNX/3pRkpYrXv0YZF3ExjaYecX2p0X45Cnl0IwTiCd9ojuArw2CBi
	 3Kv70RsOyyEtVXExHmWm1DbEkeSUzoPfv4fYLYLqCiODzThoo1R1ZWEbKJkHiUvC5iaRR
	 ihK1RigpWTu3mKqu7DD3h617dZUfzMyffII+RgWcVkTWyfZF6VYxbmqN3F3JzAClhe9gx
	 dtUPrDxOa/mKYUQzv79qP0h6oY09+6NXBql26bbzqwosI4EWPXmctn25v9CKBqRDhxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=V/H//cDTenlslMdjhHAREqoQflPB0o+9XCluigKMCNSxFY4a/btrl22w+4gxBg+OmjEJ
	 t6IqwHyDbiF89ux6xKAnBbTqn8G933PLcoJ8fV5nsVrfofn1idTDXOXCFILpUFJhM+ZRT
	 CV2Zl/c9kWIg8DUHnMPW0g8LBNOEWaNmWuTy14OGLtYySR6x6fLJ7/N/fAEAVrNEHKuxK
	 uNRNAp0Nz8i4XZ++r6/moCyrLvHxVCRcwHvme4ISl6w0mp4JbnTAYl3TJTDxXH0FaBzgz
	 CNqDmrHivLYX1+73/BtQft9NANajB+9ENZMVhoVQ28i3E3Dj3XgTrCySZs50A0bOB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C986606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C986606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3551672f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=UGH3kEag7+QnSPw8NgN0my144BL9MI6P+lzS4lSmWpGQLU/I1Wj2jG9zLis6cKkcyN
         ttu90mcZBjnspWeaKA1sIRwB9cdXaff25bi0pIzo2nlZOYJTE5UudY0yiqgN+oIc1Gk4
         27gWEvQJDPseqUIJdZV/bKhN6eyFQZ7udD/C2KLm+okaF7uw60hj4NRq7HAVpwg467V9
         MmOa42/K0JqbfZnd737Yd7PfrKLwppbtes0cyHasCRpOwm/EKfvIwi9YyvfmdII+iysG
         TW0GSAVvcD/jtsTLZMB/5KuH/HSlooTeqSEMLMXw4y/dOpM0oYUhyTRXoRWTIM99mqwk
         kqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=Q2s/TTZEBWFk6pTj6utQYp8p2RVRvT8xcvJH6Zzw7+G9IIqnuYBrgHRmP1X4PAufzy
         MfuHsIAGfWBJ0xU/1GIPJaZqaJcv3bNuw0xQIZo0spioCE/Xk6mfk2zmFKGBl99oWzYX
         /1bCO9OK/EbwaIJfs9MomLhHH60rjlRXEgP6srfUx68LhJhs9knEZn23uBfCF8z+Xoc/
         oFNQ+opo0V4us44F6V7h9BmRR188HY/iJyC2EaTV6sEduBqB0BUzcxtAMZq7zMF92OAx
         AK42UeBsQY7LbQOslw4SiXXYUYVaeCa+ZkSfK14EEaIPbrwnW1iAb4d12TQvaHl+Nd2g
         81lA==
X-Gm-Message-State: APuU4Z8Ej6EUk0dA5y2/loinqUOPQR18gBWPtFr7QFDi2hNtrjaHoW7A
	d2ed3TDgKqRSJPZ+KstBwLsI8TWBFJnK1Rio4vuoyAR6j7xz9KQ5EQyJ
X-Gm-Gg: AZFdTZdJ6rWiRKI9pzRpq0kc6w+PBFDVBdeQvXkcwSdcznwV8voA7Y1/YQVT73cPp4p
	/q/GVA1zTAAZilSYPtPGkFhOYXHro/SY7fpb4vZE6LcN/g2ufA5xzUB52DXvO3aRh4w2n61JX7T
	2lqy3ENu5Vmt32nIQ3uQ9f3z0jAFEEwCxs+C/uskGrv7HSQFoX+xmTZA3pJx3g5dqYebj5WErHr
	xERVf4jugmC5YVVcodZZ8rdb+W8cCW0pQZleSUtXWN6uis8urZP8n/5Z8OnKD8qmuGxXhIJhBP8
	I9EkkVaHEQwTdtlUWddajP/ZVnGYTkWj4S7ExMTYWURYZYalwJA/SiZcNaDH5fB9OKpZO06zH6l
	ygwoX5ix00wKbZ3FacF8ofpZGZZVsfXxmSkQHGetNTaY/hUnyx3KAWes/MAPpJH2bloNNb2AVYf
	w8XY8zlv3rWS1Iw9nm79sV/+20OO8DtyeKo8ezi5g8s2HpQAGqSc9u2O6WaT8kTEFnEU8RC/y5y
	04a+cDlIsMx/N7ekC+6SjRogVNX0dtYi+tsS2ZnclwHWeVlVxLFqYKPCsrs1f+1OZMGpG7NMuam
	QRCEbERFE53jiuNy/An9ZbDp10deuo01gXgH4Etr
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
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
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

