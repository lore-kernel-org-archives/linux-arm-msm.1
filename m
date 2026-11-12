Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472646;
	b=pPjR1iAHiJAt+uK037vpfDH/TePGvPDXwUB/ovX5hIBaskMqrwp+JwDf11cIoaWWq6Vv
	 lziPeiyxIB1pkr1GNSKAAD2+lX5frQmTRNlxayfYHl97a6f5jr1qQQ4jM159SNHydKvn/
	 Qe9C40HSuhWb0WCrOwDoMjNb0bqK08pzJk9IUzCIq9PJJwGp+aGEUOYQIEy/oTA4W8ke2
	 OJVZyBhPUXRPCGg9RSxa3nhPLH8T4B29oewRIQObsB25tzDaY4l9cAr2Z9cCBoBoFhEYE
	 yAet5reoLPLYGRNYxhcLovlkPuf7GJ6a6UrgeDF7NwuGg7t7mY907WSe6/QTbUD8saA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
	b=M3/MDkLQpcSV69o6Q+SqeIs6o7usKAEtMrWT/a96p8BLE9KIszZ4VMQqR/MPUKSAPw0E
	 BVyCzC6q+2xzHah6eoVWtDE/aWnCflb8CvchwTrsUmqq+8ejheMBvzAVKnF4t/hVkmzoG
	 NPXlTepWoCkI3rEWxRgo5wplUfr/7oWV7W+JEtQKTkdOgN9WOOcQscYeIrI9ExzzVb/8Z
	 SlBuOJV0soNeW0msHV/2dNF1xjBLI/Nlj7f0N6TpOvI3LbK5cTySpU6k3U/OrvFMmdj2/
	 pwDzOXg2OjH6QYn8mvjpwKgLyTibl8WCcnGceUpmzNBSmU51SVKaUFV05MGRdh61aOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orqG9Kdh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYESPl2O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19D606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB19D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orqG9Kdh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYESPl2O
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC548q13477432
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s5cKFc01sUo7AIsK7qLrqS
	CayN1KrsD+idNIcq4Lk6c=; b=orqG9Kdh/tdqL4fz7sOYHAtrn0k/aWng3KKYcW
	yeRLNlj2ZIMXbyHNDxvf+QWdUG5AYsM6UeqXJhPSlzXz1Q0x4hnBYy0DCyGc2nKM
	ZX+jr6E4eMQ+o8TgEFBpEUCIBGU/6WIMIx00y5XWZUuL7SjG+LSQ2l1P3N/6PVv4
	Hmm4VR9798W7RlExyV9yEtGOnxU06EWfFyrrVSeQs8ee2rAQmokhyu2O1sYZ9+xL
	PNFRoHES1PdTHhbBDuhNyEY4f4/9OSYbmHRHM6eeL+tfWWgkXLVxGsffculJUxjw
	o10H6Wm635TurdWgfTVNXlDiE+Mv+nFhJEI/QrfQXuOw4y9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugqf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:37:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so60654745ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472644; x=1795077444; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
        b=dYESPl2OzRLQlsdCFFe3NNcqgotFXhrxP992b4Q6CzH7bG3mfiGP7bJZI8MrIsBsU/
         zsMY+D6/ou3lOaaZibM5l4ucmDoyZvZyS/djiWyX+XJJFbBsnDjgRZ5wIEfpHRmYkFVj
         DgfcS3CsjXtkRit65S5L6ihoVB/b3SOMyUGureiHh+nyuxXx1PZikLaxjdyqjXYQX3pK
         Dz0wjplyfP0esmYagaiXMgeWocamL2L4wQGtORC4NNT+Wd1xx5EJ4zZ0Y3X4AAdLlhuN
         mZNa99Or8e2j+NJfj2HsBQ/nJo5Cv97Xqy2PUJ+HcKX54e35ioX7oXF8hFoqzk43jQd9
         mxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472644; x=1795077444;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s5cKFc01sUo7AIsK7qLrqSCayN1KrsD+idNIcq4Lk6c=;
        b=oWWgiJpivGUoqVETt5H7l1nsJq1CCi5cHIwT8ypTeR1jNbqv5W8UhbuJNUEl4D90uu
         xQ3j5odta03mz2vQFHYvRHEeWMuVZfRzie8aQ6vIdx8/Pbgs/HvWVNUPTwlerL2U9VX9
         ZyPDdvZ5FUhXE5+ZejFInJjw6EmogabI7icaYTQyaLrFYDiQo1xd2Plou5bDsg4tA2ty
         i2iAg5Lv/8MXiN4lEg1OxkMAMN8BOPAD/WmtHEFHA5r523hAZ3RPu7sNGlu3S7riEGdw
         1YlHaR7QN5cJ5b5OpTyVVw0qEu/EgyNysqcaVKh6YlBCR7hqPcrUT5SONtAVUxduL31j
         drQw==
X-Gm-Message-State: APuU4Z/1K/wHZJJPfV1iCxBcBUW9pzu4oYes4P4GvgQcH3ynEJgnXFpa
	fhMFxtBvSFfaW2umassQ+ItSbYcrlW1xW/geAj+OJO2KchDH1R7tGiskNhZ9XICMwJazb77Zu1x
	1e3M1rIGUNGX7bI4Ho/FHnCN2dxFl9SjgAIsbWxzuMAI5fLvtTJtEgkrFOY4NdamFTeeL
X-Gm-Gg: AYBFou11Bh3JYJWHdZu+wPC5L2S7bMn6nTAAs8mLSc8Le+nrnFna/lsNUDTEEUu19vS
	T6cwwt84MvRpJ7x5wZMT3uPaDye5D9LoOZROLm7moizO/npRNP56i1wvlWWY04DzDJlgG6PlegN
	i4V5QQdA86BLP2bq1J3KNZ0+/9mJ1HvdFUnfe/k7KeqC73yNAqFxsg4NV+EyN02IYiSWis21NQG
	c0lEvxiX4peO8MawBNYc764iREaaCVeeW246sPaoBWzxpqZObXXUid7npFTSkE+8hVyxBCH9hIH
	FKJj5sD8AEBhJ/ahUN08dHoFBz5U6i6Bz+TrvfSuXWwAqfrPBHO13o3FlM0B75w+xkOs+DO96dX
	dHbITOwfzU6atx2Zx3HwL8ru8x/9+Gn6M2eyAEJT6myhS7W1/YIX1c8nUnNCzp0R9LGg0QmxumO
	ztEj9ZtOnSZ2myyiPyla1PyXj3W+/zF0g+j7AdRaUbiw==
X-Received: by 2002:a17:902:ebc2:b0:2ed:3f47:9699 with SMTP id d9443c01a7336-2edd78bda33mr53951435ad.38.1794472644286;
        Thu, 12 Nov 2026 00:37:24 -0800 (PST)
X-Received: by 2002:a17:902:ebc2:b0:2ed:3f47:9699 with SMTP id d9443c01a7336-2edd78bda33mr53951225ad.38.1794472643787;
        Thu, 12 Nov 2026 00:37:23 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6db8d85sm29639215ad.52.2026.11.12.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:37:23 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:07:15 +0530
Subject: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
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
Message-Id: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALp69WoC/yXMSwrCQBCE4auEXjuQNKLEq4iLnkxF20cy9CQqh
 NzdVjcFHxT/QgWmKHSoFjI8teg4OHhTUXeR4YygyU1c865um30ojxgMGTLBQh5fvnfITfyJRnp
 OaRuFW/JANvT6/sWPp7/LHK/opm+R1vUD+mJT334AAAA=
X-Change-ID: 20260917-smb-repeater-power-leakage-e1af2dd4ba29
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472640; l=1815;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=4R+eF9bAIL6YSMUPTI+knUnLAkaWbtl4NCeVfR71log=;
 b=ZzNZ+VdQvHot5SMcCNqgJgKYaaddWL+guQ4LprSNJ84wkPMgXfnCsEJU/+VVitfVEvcIk9tA7
 liQBUwOBojMBKkLkVq9Ir2jrjnjrzXmlrtY/SfN+frKUoPDOgZu1k+L
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: 3DRyyaufYWp_s01GhsrGhGW7hMC60vcf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfXzFfVzw84dINl
 BXNbJCOwAmI/YyuIypcsE8RObhqmGXqbe+clkRAcLw/we4bA8m0aUKpPxmVT7JcaMbbPMwDTslh
 9Ajfhe+q3a835OmGyZODYGB1LkxXRPM=
X-Proofpoint-ORIG-GUID: 3DRyyaufYWp_s01GhsrGhGW7hMC60vcf
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af57ac4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Hjf45h_rMJPOqh1JJtUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfXxeycHrBsI95j
 sSgtuMYZpQ9tPyMIGO2Dine3q6GZ4fZbz8QOs4KBvmRwPEj3kjzKoWH6IBhVAV3Prqk8ERN9j1r
 HPsmM02YA4qUSytZ3f53Nv1JJ2c5aq1QtKaVlYUzHGwZr7QSZdljJlSZEs2hhuW0xYY1XQCqFQu
 skfbv9AzJoHUDz0SKeYQS9u94xqJj+2KMsnrx0TNTnzSKaI2AqqLx0R7JO/7tCT5U6LgtOzNTDe
 N53jxbM4LhXvnaVLsADoi+KosGT8wLBaaKH8l/TVHH/o8XQkCbpCLcCdNkEcoGSyczabZ+C7T0p
 bx8G9UgTUCcL46IvbRAS1jPG5nVnNPsH1frALvzLipiiuh3CvKgxuiJp2yipGJz7n/+x+e+1zH4
 azNVUdtgOKdKLBFkCHGP32ajk0HV1vb7nEwBapmlLBTDLVEeAlMIPEiiXjkIqfTVk5UkyxFS+vX
 hOT0Sy16IKaZvZaO3rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120034

On Glymur, it is observed that although the exit call is done, there is a
power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
well). As per recommendation of HW team, disable the repeater during the
exit call to prevent this power leakage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of phy-next since [1] removes the base variable in rptr struct 
- Kept the RB Tags intact since its a rebase

Link to v1:
https://lore.kernel.org/all/20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com/

Compile tested v2.

[1]: https://lore.kernel.org/all/20260721093626.96264-10-angelogioacchino.delregno@collabora.com/
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 89bc1c89fc85..607b5a5a1713 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -227,7 +227,9 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 static int eusb2_repeater_exit(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	struct regmap *regmap = rptr->regmap;
 
+	regmap_write(regmap, EUSB2_EN_CTL1, 0);
 	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260917-smb-repeater-power-leakage-e1af2dd4ba29

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

