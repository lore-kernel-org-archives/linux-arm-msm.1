Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B298314D34
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748789; cv=none; b=cFBoh1IF/tjw5y8Iu3X3lmoWIcnAqzWAxSC43LPLRq6VSwH/ivS9ngFqAFBFsWEMHLBlkMpTC1Ylq4my2IsN08i1f2VA4R4YtTcICyXD8wn7l2wzXC5Cnws3ipKiw865ePzfh74nhkZim2+6JwFRK0zdd3X1QyA2PlDWC2hcUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748789; c=relaxed/simple;
	bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OLmmri6Mv5nDHEM1YoY8MdBJJEmdg0F/CNEBluUcy5oYTN2IAfxeX/MMwkzevx+SF/ifjLHA1LIA3xIJCli6dKAPsBAnHE1BnnN6Or2BQ3qypQ/X7A68NhcgqsDfrpkwYYqyiuiUFlpHEMCHcWh4jW/l806ec7d105viaQkaCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH2TRf1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCH8kIPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH2TRf1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCH8kIPP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BIL2tp3346424
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QCffxlhXptHA2fxCamUbUo
	Ww67cvQ96kdRlJhyvXZ1c=; b=dH2TRf1n9RznsTHS8HIPyqincaWMt8/Y2gwX8H
	klTNyT6ZKAdpI4N7A8uIbXjEFETXl2QZICS0SRtdbQ/XRuP/k/WonehRr8qfF89G
	9nZzw+pSsiim5imcT4SCghtXrq4M7eEaxy5WglVETMM6U6vonnmMF43btQUuZSPI
	NDcaZjKnLCCvaD9eHDvp+EH44iXeKK7B9EbEPzDOukSXG0GzL2FOF1ATA9H9YBO5
	5VEe/y4cod6MzomvXrEsmKKxvcmhp/BAtvJXvvJVI92J2uUJTCyW3fGhnPAJp980
	F2jk0aQvvayPHW7Je0GR4E5Lrk8PljXUl2Lo5NV7uaxyQQBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9ugt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:59:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91064f6e75bso61141846d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791748787; x=1792353587; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=dCH8kIPPhDBXFPjFYmzSlckZRdVcbFvRJgdtpDq59yK1F1QVZryuK09RAaiZtZcQzA
         Knzze/yMinEw/7fL4iSkFzM444nVNXH6mPrc+3wZ1/JskP82zdy+p1kyawMjjEmhtp5N
         ksba77dCovbdEtOwcvg3ozfUHKspaB7prJcoVc9LTDq0KE1B8pcaMQgfdp99BBbC6HWH
         nqp2MnDveMN27v3T5gxLN3fCAc4omWfmkmP08zdzlye8mjWYHvVg4eATIuSs9uVB5jeV
         5iNEkbTOXKY35kgsplXY3NwicDr3jK80fdHfhPWb30q0jE8+jjplYRwA1XH4bRiEWlvV
         2RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748787; x=1792353587;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=Bl5rHVaURAikAP3JxWWQZYLYxiN2m6V1SSalVMitRyeAEqadnx6YkpXpXU8o7+KKx2
         MIqh4Xcf5/ZrGWCHjssJ0mK3S5b5ir4dcLVI4mwqfYWeuA/WhQHeHbqTBJLNuK1uHiqz
         cyX+g3TpEpD4XnyUUqvrKG838JThs+X0PbbTf8ZZ5EdTkGSfe1N67JqQGBkiIbZBdMyT
         mFzCxfbqP1CwXpEOpnysFzPcl7QIkqTX4CSgIDP0qTl8LIJnxPnHHkY3mn0qu2o0MyPG
         effub2wSkINNJ9pi5u6a8QeCMa5aN/6kp77Kjtb5X2FwOEOnOV+SqVucy/U+cjZC6sMU
         pj8g==
X-Forwarded-Encrypted: i=1; AKwUvByt/Szcb27yJb+GRr614yVjBsDNI0wlFpxFZxnavbHWH5Q++yQP7pM3r0uCZFrZJA/JadSsmOX4t+zhaoAr@vger.kernel.org
X-Gm-Message-State: AFq9FYIhc5uepI1eL5gj1Dwpm25npemXtRDyk8mg6sztQYEKbf22xOZt
	41ZWeEXVgFaRKcTf/jsOh/1casU1SFPeGWyNGK8Rg+lq2HheGlYEgC53K6+S6gRce5Gc28uOaEp
	Jf52JPypXAJX7XAbKcoEKvu548Z0A+LB2r1tknzk9h+YbtNRt+Tjn5n9EgIMsmNdxIE+t
X-Gm-Gg: AYBFou3yee636r68TOz7YR/Ua9eJoPfSk1CQqhHVJ54NoIZFtg0WepU+sacGKR45Lge
	FuKqU12oO0mY/rpmABVDXwhYu2uVKnts6pLQTo1BNS24qheYVBedfkRC279MI1W0DUGRv+aisbx
	b4A1Bs7lfRune06HN25tj9qQrjtezuLofWbhWecAL5bu5iEl8jIb064REFW+P02vOSQX7sVGC9j
	iI2Q7mtLyXlKR4qYhaXG8imYahp2BKcb040zBrSu1TP3g3j7WsLVmj+llvM3cO5g020d7fZ6/GL
	SHcvXOBZVL/JLYGEaaygrwCE4uIgbyqWIXsXXhbTcHxnEuah4Iq0BW5y9ZUQVyqrSOusFJVlwXr
	Vi+ZZvLpd
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364102585a.27.1791748786565;
        Sun, 11 Oct 2026 12:59:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364100285a.27.1791748786012;
        Sun, 11 Oct 2026 12:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm366759315e9.8.2026.10.11.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:59:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:59:35 +0300
Subject: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKbqy2oC/yXMyw6CMBBG4Vchs3YSSrior2JY1PYHx5hKOoUQC
 e9uxeW3OGcjRRQoXYuNIhZReYcMcyrIPWwYweKzqSqr1pTGMF7ysTw5AY9eHUckhJQr9tbWl84
 3TXceKPdTxCDr8b71f+t8f8Kl35D2/QvfIOVEfQAAAA==
X-Change-ID: 20261011-eliza-pcie-gdsc-retention-daa497d5578f
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqy+qvhTh/eEOu4fVtb4hgNEZmNzojZKK4EdPSS
 jzlJPbkzWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCasvqrwAKCRAbX0TJAJUV
 VrRND/431MMDHKd/Z09ZznOjj0iswnwhULi7wboTwHE0c632L/uCWPKi5Z09baWOH10R1jyBOgS
 4ZCrdDz4xLv8OXr0lMR1O6OgnIcFsmgVLy1n774JRAsZ43AztWAPzgyKbFB0AibBS4kZTKCKh4x
 b1bISA//ZBM13xiAKzpgOGKtCfQD+3lstszo37bsW7f/akaI67cz9LQ90sNdhPQpYuq9dQl+W0t
 isBFImlQoRHR+DOzU7Ch1EOa4388KnsRQbyY4zV8cQgIaIzWJ2IB9HvlL402d1onfnYb0QJ7aU+
 12O2BwS2gMWLGd+ERWApT3cdYcwWxcfVO514WA6vF5Z+QY06TUCyt9JmK/j9A77Er/wpH1/Xd0B
 nddBAO8CeVaNloz4mGDPLd9egyZMwGXtZrbVXnljg2rW/TW65rIYKs18B/jRm5JXqONla563IAw
 4QkAR35t5Tl+/aoTmKLDnd/pZNXAszzkbLVVg3z3Fl7Tq2oHNiUVIiaOsaTDfzv5Nhl28TiIVT1
 xlhtRaoDFUUt5urHsgFcOkpnsf54ssb884bE18WONpDt3rbfWK0faiAtYIQl0dfiliMdjmUvgFF
 PUQTe6VfMhcGxfAtg00eKNj/5E7ZRO/nYfk5mcObrUhM9x7/hd7LqeTK7HDxFRjBqop3dflPl2N
 ECyVkaaucKf+oOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acbeab3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x0TZ4X2153IZKJAi_hAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 0i894b0uMaDRiEDTcexl4zoQvXiWmMeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfX/903Rk/yvPSb
 oOUeWFhFeHGXvUkWz1K5kYMneXNrwk3yPjPqLxsF8nU22udrXI0BlUJEbA0iT30JqlmG6KTCQkQ
 EhknyxRdLc+AnwDIM4HVmbHgEI6b1G6jGuQCtMS8n04Fvq/BqKqmI5fUc2zkNeUjfsgtZQeZnZk
 5EXAOT+7wSrgd70kf/cY8igadKZBMDRcFRh8qLRG2AhL8+hxbh6wBiPd7DKcgeRM80wabHM/NpZ
 0TWhqOTL86mMUwCsMIglJM5rOrwJviaURzavYJtW3FFrZMxMZ30yNNxCoO/4jWZBQvFbiopTLCq
 ckJTu0jdU5jSbKxbtq2s6zrzmZJsBhS73VxeH2TUG0CqHoQkQVKyYU42GJGyYZGmYrKpGbmrAwV
 jROFMntaNwVA/tTuFz2S+Z95xeV3a8ZQulnWbtAsz2aQU2ktZOv9XaaxcpL0vSBnGHbRhciKCWP
 PA/CX5nFXXER3bNspLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfX5iZAY22tceFA
 uDyztAXTClgPa4RKNy2vBqz+sKZp2wqltu213MynRb2ViCOpUU3hDmjcO4JlV/nRAvN2NKPCZYI
 0sy3Tsm6VUMG6tAAwirV6kejC3Vaorc=
X-Proofpoint-ORIG-GUID: 0i894b0uMaDRiEDTcexl4zoQvXiWmMeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110079

When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
gets stuck off when powering back on, preventing the system from resuming.

Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
state across suspend and allow the system to resume.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 064771726e9b..21fd93a1f6b2 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -2715,7 +2715,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2729,7 +2729,7 @@ static struct gdsc gcc_pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2743,7 +2743,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2757,7 +2757,7 @@ static struct gdsc gcc_pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-eliza-pcie-gdsc-retention-daa497d5578f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

