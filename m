Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910314;
	b=RLYR2C+C2MiL3lio8eIwkEuQ3jtkRtMQkUA+7jjcfy+VK88I0j1xmj63y5jE5iT4NzT3
	 INix0Z7Exn32X5mzz3cTxXHvC27XFTPiy/ttRbx0Mq60scslJvxML/D22x+0+IpZxAy+K
	 MaNtRmDt93vWVARi+vrNbp7KZ90QTYTmHfeAZsTnd1S1xldZigy4gCc6Rq+7ZrDz4OJbH
	 9h82tBZtixBCfUJDfZz6z2B9b+Ql4BhASBCndlqrwze1EmPVVpisLST3qNwDqGssODVKT
	 loKJ/TtyrG7JaxFSU8NI2d8uMY1gfjixfBCBjoVKGRapdbjnVEChL9nCyzWpzK+070w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
	b=pVWmfuE4KuEiQIjgw5gaMX8Mw0t2yeCJpi5vyMQQSSoaYRzdj9SmWBdtN2XneHpgIKHs
	 NPdU+Mh3NvKT36VbjzRNxFLo+vi2/Yh4Jv0J/H8Y0YIzoAj7WyVSShHS52fVjK9xMySRw
	 YpSi9PHBuPzv74+XfweqYiOMT4Gu5Eq5hwwnulqtm2inF1kkX33OEEXHCHmzAA4WWjjvA
	 oA0BdnuyeGVQN/AuTbW8InzKh4hOkIBI6w+U7xvPhkUXl+D//gDzDT5FTmQVESK7PYnc7
	 KPl8/2gOHX1shy3SeHxrsRkxXMdgaF60ehfODxXg7msZzY4f6I6hQQ8PrCDB3/xJz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjCHGjx8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q9Y8g9/p";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63B8606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjCHGjx8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q9Y8g9/p
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f0QF2998606
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DwAPZke92rxdRB5l4mQb6G
	gt4O4kBeEuyKiTLtaStHo=; b=mjCHGjx8KJso/mMxdzfKzmJb9l2c3ymZhtLAIw
	gf+hcbzg/yYfAUgFrY8hQlKhkRVlHjt++iV2wqXWesDoAyelWYRMUEtUUqIrhZ9A
	4m0C839vn5PVJHy5WcCmD171MbZnNuAgVmGi/XES6K1xyIjmJuCBs+9t8yooLlgJ
	yJlms+6rS4+K09cx3NWXQbjX2fNH1nrHKhqnXJeO8OBb2lghPie7NO1F2SQ53XA8
	PCK2Gi5Y+guGX/1DhRR8k7e7WAW6KeAy5JpfKOCdhHhW41ziQZCB3j5lKYnVe+IQ
	VAQtdlRSx2DFG5tDbuX7qTlHtuw5A/9ln1xw8JechX2ybPwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0uxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:11:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2d54356fso9594541cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 02:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910312; x=1795515112; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
        b=Q9Y8g9/pV18WGTlJHAsh9UIhZXjV1a0OA+G9hu+xYxgW937G6jJpvxPsXospnIGzwz
         RcEh5dWjO/giUDjDDwLBvi1WXlBnKVA+wToln1vGUgxs/XkNOI8T0dhN1jf1VTq9GZiL
         VcrR2H2I2eFaSxL3ufLHplsktL3P7/PrboLdgvBa8IUvFL2mhouRZlhuSF0liGPadhqD
         GUOXNhQ0gwkVMzA1YXpcQiTup5RbgFT8/N0OoLvvC4ODwVevOXx9RVayZvE7PWj/N/Es
         Oy6sifm8K4a0V7TMYVVa7Ii6FCrusz94Guj4AyswS+UEQlI58zjzOTB6rtkhubneA1+/
         OxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910312; x=1795515112;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DwAPZke92rxdRB5l4mQb6Ggt4O4kBeEuyKiTLtaStHo=;
        b=jeX2jCHkr7c+MNuTKg7pUrb8jTsW5BeQRN7cc6ZR633HflyzI9hbk6JjDdXcaKLGn9
         CuDXHiQ9XT1AOlxGFSIBDf6u2aoSi6IfZzRKhX5heQjC5fR332Hvy0Idxlu2zDZje04z
         7z3jryneBi68NWEJe+7OW4nF3Y+dnzJBWp49qUWD/kPsg0uqPeh2aJGzzTvLEbH+ddC1
         QrhC1shMfxB3ZuxeAG5nlAg6nWzc2wYMTvL784rJB9HRfrpL5EAp7ZxIBLKfprBpO1tz
         d7VSGUkNy2n1Sdy93ioPsjxDzsuHO3x8NQ/PlVtXWAJel0uPZlNWjlEZkyMxgAExcEJk
         woqw==
X-Gm-Message-State: APuU4Z/Bo7WIvctWlYsV+Rhy2tEAMrRplQ3EIGRBrXr3aCZgV4cjt+F6
	8vG/cClWg6KFVqOzekEY+wHBltGULNYCODwGiuMOoskjjOU6Z62jlTHsz/AclfyxSI54HpM/FyS
	l3Wla4k6RrhCuGdl5/t3WO/d1Na/ghEJk8OfRgijSsgvIshK2Fm54AGCwJpv9Vl8CD2xy
X-Gm-Gg: AZFdTZeqUn5iGt3pi+p0O/lREhAd1zqLpGSNN1R39Ow9n+AkPG3E/kJI7Ktx6hpnEp1
	2Xmt3sJVIDa50qiX1rnP/Kgt4PGyQPEWO4kVwk2yyUYmp3FeNgIr90sGOWnHMZC56ujJIv73eM0
	5xdoXAxAKlpd5Nhfo2YawSZrmDBgF8a4G/2vWBQl6/MafG65+klXizZ8nibwT7STpOxDw/GWrY7
	H7ruV2Tu+vQd/IlkSYJTXZ7Ce87QrEMQRc0HmLyZ42gkRemQ5BppgRcvNZGQuGLkdAO02CZYAQ3
	g8SD/9ezTRDde0ZvpqDZOFmEoz0q7jYtGgG11fZ1DLZEkRZgC1X5uYn0QAISo6tS9HUBbezjMu1
	pJ+P729qc4fIUGBKILCBu8D73c0AnIffrfgGI+6p9+HLEC26KI4Q0ka0vIyTRjOPoSCzjr8yM02
	IcQQ==
X-Received: by 2002:a05:6214:c65:b0:91f:27f:9dae with SMTP id 6a1803df08f44-91f241dd471mr281994286d6.3.1794910311858;
        Tue, 17 Nov 2026 02:11:51 -0800 (PST)
X-Received: by 2002:a05:6214:c65:b0:91f:27f:9dae with SMTP id 6a1803df08f44-91f241dd471mr281993946d6.3.1794910311274;
        Tue, 17 Nov 2026 02:11:51 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784e9073sm60433415e9.6.2026.11.17.02.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:11:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:11:44 +0100
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Disable TBT/USB4
 negotiation for now
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
Message-Id: <20261117-topic-pga_nousb4_glymur-v1-1-0ede74e620d0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF8o/GoC/x3M0QqEIBBA0V+JeU5o3KjYX1lC0iYbKBWtpYj+P
 enxPNx7QaLIlOBbXBDpz4m9y8CyADMPzpLgMRtkJRtEbMXmAxsR7KCc35OulV3OdY+CzKSxaz6
 6li3kOkSa+HjPv/6+H6210yVpAAAA
X-Change-ID: 20261117-topic-pga_nousb4_glymur-ecfb1863b427
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794910309; l=2049;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=7abIt526yjopLqD34Kc/Js5bzzHURYriVZdSZPxanVA=;
 b=qG24jzDdxIK4jIeorenienkVcs9mnKMn3GIHVfgUDdFs4ccBo1cZjSt+mpJWkH0Ytbjo3YdBx
 CYHeM9BAXWrAJE90fqfyn0CnFBaynKEap3dJ/Uh7eekz+kckUxB/WDm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX/1LcLM+JOf3Y
 HWHISLqFFlGIneKXIgT8L5L7R7rqYDrUyga6aoTKmyfNXU48b8aRbm/ogE4M9TBmGjKGLccvUzt
 wVrVW7u4cciW9AEUQ1YQsyVan025whY=
X-Proofpoint-GUID: tdCzkGUd2_NIkaULs325cAGdVmkwOOzb
X-Proofpoint-ORIG-GUID: tdCzkGUd2_NIkaULs325cAGdVmkwOOzb
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc2868 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8BIiFlID_qMi0gqYw_8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX0ZsMGqEvHN9X
 N9kNOUsNTefmdIauZVwfboxu64FLZTzvgdrRPJTQAjBNAt2YrPg0gs5U27v8ZCdFOsCEft1B+Ys
 AswQ+xWl3F1fqIMRMeHn2oC5MmGdEbWv+BmOS0A0yAmc79+L2u4wdV63f9PIq5L9NN4SuPDVks3
 5C0Z32ahnHyNHaaoKHKlB99bEwz43hCn3CJT03LCgmdh3rhcCOKCuXKfv9z1F0Jq9a98kPYUiCR
 ryeYXVVj+h0IbS0rbOgG52BJpC310dBAyfK8s53H6RRZ+H4CFGR/A8jGyD6RZgQzsw4B/1oAjAu
 +Maebeqr2nRiCm49PhEmHOx/4lQ9nKopO0Rmb8cw3oS2dcH35GwwiD3XoygYd+S+H2TN+zo+Esl
 5qP1xUD8EjsRWMiSBgJiHqvPkzaIrHVmCpb02B+xwHHJ8K22qPh3Tfw4ocNQHcA6OUxlzBEpjZL
 4hNWXRA40k6r+SgpAkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040

Some platforms (like Glymur) accept a versioned flavor of PAN_EN,
allowing to specify a parameter that denotes the OS type, which
influences Type-C capabilities. In particular, there's a setting for an
installer image (which implicitly doesn't ship all the required
drivers) which disables TBT/USB4 negotiation to let the connected
devices fall back to USB3/DP mode cleanly.

Utilize that. Older firmwares ignore the new arguments.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Tested on Glymur with SOCCP.FW.2.1-00267
---
 drivers/soc/qcom/pmic_glink_altmode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0485f639da7729066c05069b80fc3..e648653697d5a9bfc7e293e9bf3903656148f026 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -32,6 +32,12 @@
 #define ALTMODE_PAN_EN		0x10
 #define ALTMODE_PAN_ACK		0x11
 
+/* These fields are ignored on older FWs */
+#define PAN_EN_OS_TYPE		GENMASK(6, 3)
+ #define PAN_EN_OS_DEFAULT	1
+ #define PAN_EN_OS_INSTALLER	2
+#define PAN_EN_VERSION		GENMASK(2, 0)
+
 struct usbc_write_req {
 	struct pmic_glink_hdr   hdr;
 	__le32 cmd;
@@ -548,7 +554,10 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN, 0);
+	/* Set OS to installer for now to restrict USB4/TBT negotiation */
+	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
+					 FIELD_PREP(PAN_EN_VERSION, 1) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261117-topic-pga_nousb4_glymur-ecfb1863b427

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

