Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88264A5EC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636048; cv=none; b=Y/Q40dC4oMQXCoiyOaXX2nXM3/r4OR4R9LPFbxqGqXKgad/B1Gikc27O5IkGHcTunvp56x3vH3FgyLyTpl+wiuKU4IJhcA/ASnA/xbIV1lpD3hB6sSD/Y125IK/rAlOof2sU/AHfeV7KJPWlHOq6flzbyQQZK3VqcqKXMYqekpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636048; c=relaxed/simple;
	bh=fFTHVcSxnVH4BOcSYbBtzmohd1ABiXBFSqnZHydNdPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IKpNLvlUuw461TUTXcBtdirIKqe9JIEtoaXJfCvZeJL+bi1F2nU6tH9p3Z2f71PFa24Z7HzpYRnp2A+u6nmntW/ujzg/vtsfZlljeNvqW8boVhaaCOZezSDUFYKAhG/flWZ74zo+qffCN9TTjDwExgRPHFX2bfTyARs6mKvt91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASB8bWKM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASB8bWKM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so4373545e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789636045; x=1790240845; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ft02DoC4Lx1YaLkXIk+hlVL3bHmDCb9OgkRYwRmtwuM=;
        b=ASB8bWKM+3SXpQeLj9nSpSycq6rXrtVq5o3ujEee+MPwA94b0x+imvjUssejksepvT
         q442zI9gVDbshHbMUhSnHpArlph4KKoyw47Iwm3N4VrLxWNi6015cuJlDu2Z0QQG2qK8
         7bEck+dFVdTcI4luWt+QFUmdMaYCcywASNDFPIINTnuJJwH1JZ+XdozXu+vDkxa9fsmG
         3fnTszO3wh8U6azoxuxHP6IkzzU1/D3Q3lytnWeJzOcDTm08JhOdlnDhzZdgDdj/2fPI
         nHNPA/6AbAnkece8ckzNs86MHOG+vPx0XAlWBkedfGEC9tZlwSdPvHfVtsMa8Ttpgosp
         FKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636045; x=1790240845;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ft02DoC4Lx1YaLkXIk+hlVL3bHmDCb9OgkRYwRmtwuM=;
        b=RtkrLeTHl3VwXX7dagI3GLa91O9gnmHSZkHxG2X/1KRPusdQ4fxcc+36UTgWL87vSs
         +R3XUu7kc3ounrBHFQxJCI7f7ou/lDZobpx/DlQmUBd4lAkBdeRIOswT5NjgwTptB81z
         O8WMrxwPIVhRr7BWoD4jX+z8jnuIOdP167dlf1dAae4JkY+0JGtezrIxg/XBsGakoCmv
         QYXrU7gAQY79+Cmz9vFehSKMZQ0ujNFunxp0kkZ5s0mzjyq4OK4EQUsdxlfyiI7h68cj
         r72Zz1MUaltJJiNx9Pr4CvoxJ3FqEoEh4hmniczYly6FlldFAGKFLoQhheMMssNz+KGZ
         2NRw==
X-Forwarded-Encrypted: i=1; AKwUvBxtIznlLXrkdLzIfYxvie+zfYe2AWyAWgc0BYfiwKpn53e9wj5xF3Si8Hri+qINvFIPPi5jzoMLwSR26jNC@vger.kernel.org
X-Gm-Message-State: AFuF++nprXTj9bnasStxHoUiPS7lw3ba+0lQxmIpu/xnTPALHBGGd+Ih
	PNqzQoWOn5SygrE6siI/AWXI3YYGesk0HUrCPs1tQdjHbxiGxcztgtcMHR92lDjlT/Q=
X-Gm-Gg: AYBFou0Rbf9vGD+OxN+TobmhtkJKVRhpzh4gjIRrhcI9BM9aXqkMmVdlZ4IGUuR8rTR
	UlOBtaLHFtnBmSINPWTFeg9QDFlCnsvB3ob/FcXzqLuKDethU6EmONGNS8ch4BpM4XWijISLXHW
	09EDmwLNRLKszlHdqHo1irMdFv8XxZ8RsgCp7CATabQlnbQwPZBf4h4hDwKipF+GhI+B1kaZvcH
	7D3jTMkrS9PyJJ52fx9vEFa1vujzaKv6qPwwNZ+chK4pV1289MSJ3sgIvxxh1Y7d3r6jH95x2y6
	NP3W2jJWp1o+GolxtepKt2b5LMZXXVW/KOCHuN5/kvoyMe+JGLcJHYc8xLS84YDgzkm/fpZei+H
	owTaGRwjyOZDR/AzzVdmTVitcMWExuaWnYQq6xUO4gEs3U6OkSNg7PycHdp6oksFQZIIo4SShlb
	veMEKMWAuWzh1/x8EjAVULSudMUPjEZZ/e6ElNoYoNUHSwBf4wJ+NqcNmllUEZXQcz0PDkTsZO/
	wa40CHpYQma98oJurA=
X-Received: by 2002:a05:600c:e549:10b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49f1d516934mr42427645e9.12.1789636044780;
        Thu, 17 Sep 2026 02:07:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm60891875e9.6.2026.09.17.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:07:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Sep 2026 11:07:23 +0200
Subject: [PATCH] soc: qcom: geni-se: ignore invalid PROG_RAM_DEPTH when
 checking for firmware size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-sm8x50-i2c-hub-fw-ram-v1-1-f49286d8c8db@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMqtq2oC/yXMSw6CQAwA0KuQrm1SBgbRqxgXTC1SEz6ZgpIQ7
 s6oy7d5G5hEFYNrtkGUt5qOQ0J+yoC7ZngK6iMZHLmKLvkZ53FSRuvr1ROqY+yWgO0HY9OjL9l
 TEaSiooY0TFFaXX/77f63LeElPH9L2PcDImz/xH8AAAA=
X-Change-ID: 20260917-topic-sm8x50-i2c-hub-fw-ram-54c503be6038
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fFTHVcSxnVH4BOcSYbBtzmohd1ABiXBFSqnZHydNdPI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqq63LbA6mKSkysG5k0oIX8bW4KbJw+Ojm08gHJiYV
 krV3yciJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqutywAKCRB33NvayMhJ0bspD/
 4y8VKjx/jssGG7f+iyZ2+RH18i7WGea/pHjEEUakOoNh970zxrEhzFHMlI3/Tq68qphqu0m5bn8oss
 oJz9FBR5e0sWi5sdZRnptoAwNZ5t7i0OBkHGe8hfYCc74xVr9g++0cG7huHMifVT9C2Vk/VSnzSRNs
 W7UZGpa3+98ZI9mx/0udIO2PkJnAtgcPDQ2FL0lGBHKIEiFXtWQsPwSJCaB39JJ5nzBx1DlVG3HE9n
 VvegfAPewtsn0GTBKab2iZLDxvpkhzeB5ftSG72mIkIiqbO8KKZs97WL1/u+GyUYN9EeHGc0tcVVEs
 LOGqQh9OrNReZ6tNa6deO4z7yg4zOmskehd4R0Qbxrn+OUeeyh9Yq01Xmul2Oy0iZTyVRGmVeONOy7
 d+QZqGCRKFq0z+sIgKTdtyP8xrI78rN614mzU0w4QjLhvxWxl7grsWCBKZt+DSQFVDsEOmD57f6W3p
 LYen9933QEU9cFntkXrtIA2kNZXVnrajrSrjz8i+ITPOVu5+ZOl3DV60T5vGtBqDnhioJp99sRVEGO
 B7srtuAzc83rMCr92jgj+0d17sgiJZcja0DFughvuResUD1AyJIQKw4QS5l7l8jEWSxDrSlzbE0l7j
 VXXzI/MPB/TnbjPifE/S+5qTxuXs5w/nzHEKPwjRCmwWRzhHN7kxeM4/MsCw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
is in the DMA register space doesn't exist for those instances.

Simply ignore the ram depth if it return 0.

Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..e75349f2c15d 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1308,7 +1308,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 
 		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
 					   readl_relaxed(se->base + SE_HW_PARAM_2));
-		if (fw_size >= prog_ram_depth) {
+		if (prog_ram_depth && fw_size >= prog_ram_depth) {
 			dev_err(dev, "Firmware size (%u) exceeds RAM size (%u)\n",
 				fw_size, prog_ram_depth);
 			continue;

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-topic-sm8x50-i2c-hub-fw-ram-54c503be6038

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

