Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12D440A1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738226; cv=none; b=trYldQtcPoFL5itBzUNWp6O+hbhXmwuysM+FtOMp06kC9vccMMk0MuQAptrTaHghL2sRa0mTfmdaXYx7AG8052NRfRVHTKX2OSZPa0W3lLX+f5DrY+nngkz9LQtgsrNLD169Yc4W/DkCEHIlPm8jrp1dRcDQSymfm3Et32R/JIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738226; c=relaxed/simple;
	bh=zyDOln3OiGBdlBxqcr1BXdk9hHGvfDhH+FZ9x2Ip+f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSeOJpcRwk1CSE9hf8GBh0AlEAoxxnhJl84BftzbbKQDJ6+dJ7RerAhASGxOSmaLIQVKiF+W1eYpnIwC4y0bawJ9YXtSXMtlUX0x4MzF6IsyNcyog0i53AmhWXmgWcYN8GpyKt3y9UgCxd5UFNOvkD8D/NE5bITt11LIzFmNQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkeX03hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RD3iNU85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkeX03hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RD3iNU85"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXptO1259185
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nehxxfZ9MrvM5XDohYA8LlEdo1Pr+Gqay9I
	QAgimWK4=; b=LkeX03hbJjq1vrjKNZzHJxZRNjAvr5aCZXur8YnQwTDlZiTXXrs
	wXuJr4OllUtXLmNo0lBmfkYtBvL3v921rmi7farQMh4Uz08DaKheLf+OzG+fmJ5r
	w66Ae2J/fKrS2CFU0dBZXbDWYSsgfHAsKu8KgJbCk2NegFyxu+W2TqF6qXXB51yY
	RT6E3YnHZVkuGr2/xkkU9hh6mmKkqFwvY666QC9rBayulkuDMdrW6JWvkCDeXfBF
	2x40+D51NjfjRW2ZPhPOMZCMAmh74TQOawDHW/VQeJnn5fprLJP5SldrZ9gSBQAl
	Dd/Z7pkyAm98YkU7ONjydhw3rSPx4uOQ4mg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu79maf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so234006876d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784738223; x=1785343023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nehxxfZ9MrvM5XDohYA8LlEdo1Pr+Gqay9IQAgimWK4=;
        b=RD3iNU85zRjcvrbAYGMqk4WNafRXexwq6m3NiFhLFDbRx8a6ajlq4oWiIrlpjsRF9h
         OSjPo5OqzM23eG/gF7gqK9LeKTOWndOZvZNYKIMMcnEHFIxt1YWVaWZKH6bihp1o87pl
         Jfh1Zw3U3x0dr1ee3txFM7s6c0j7tPsG/t52AhfQb3Get6Y978YHCqDTtJwUXpprUEXp
         ch5+gPs+AmKghE0kAgHrZ93o8/p/ckMDdkGFPk6CmxqoRK8dfu71M7LBSOk1b+NUCexP
         D1OB5f5GdbnXlp/qBkaKqENyDGMTypdVw9pHltkX+O0Cy1jVhOnZucEgGSCLLLy8J4dn
         +94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738223; x=1785343023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nehxxfZ9MrvM5XDohYA8LlEdo1Pr+Gqay9IQAgimWK4=;
        b=Y6OjVy43KTr4X7j09WZsJrmph1PK6aJ6LXN+6ByUerYpmgMenCg7BJfQ/rhLGdHhm6
         onF/rh8iAVXIutANW6sxfJ7ZzUbwgmsssNGo5kvzq7BIAdp61TMzubFKL1KWcM8cvywh
         itKT8oHK2yQjgR6ibcnDTAM+WyfK2cC/4xOJatB/pQVMqJs7ZltUEzVQqrXccqToLhYo
         EaJ4YVwU7SfuO5obFGHKgCnrvcSXv1zZ1c/trtEfP4Y20l/OCELw1iXF13HCm5ailL5w
         tnmEDm2AYFR+sX3ZLGL8nNw7L03JOJpqpQPQ+R9nT9a1PTc51J8DngYRVdwv4HwYxiiv
         mfwQ==
X-Forwarded-Encrypted: i=1; AHgh+RogisJKpPTscWuWsGJ//BIfhHYr60Bx+S9cxGhHZfaGBV6VwZRv326DaEF306K1dgrmuUGcR4d+wBb9Mo+N@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJoNtEhSP7nKKTfBaRubEMqMx0/2jB+0KSBG5W/oFVpXNzFkJ
	ihXmyIQTh6e2TOsg2dUGbV1GkLLjeFZTlVeIIcl/lU4D5kyj6+VPDt7Jit9UFy+ovVScFZeBn2h
	P1nUoPFk1c1l6TtAq3mdcuDcSweAvb9MYtzFHSz+3yn0M5dEdYH27vZ0/34BzFVTN+zd2
X-Gm-Gg: AR+sD10O1nK90k+NNEe9fW3Dm3Pta67yt8ZD3SSu+d1tc0qQYy95FRbvComvlwrklxR
	I5qrWKpvjXhAqkuE/QP6s+gyXJHZcvpzq7ub2ZYEQ7qV5gxGMcLaRS9UgjtIZxwSIfaDMfenD6b
	0sR1ZISpDDxBgpW1svwV1W9BRK0kQH5RgxQ7EVJdg/WQj8S7FglfzjNG6Tjsko1yiQgtDqZUTqd
	ETpwxk5jEm0RVNPQ8/bwhUPFE2rpmshvXhKqRFPh/necJm8rDI+pRIa7VHJMkFr6Tfjpb0rEZz/
	q5ZjLn2fEX6AdkahbHL2tWJtwRUqGPHbX11N6opWHBLEVEUptSEYUk8j0WUlPFr7UFgmeImHu9K
	l7/zX279DJhr935EZi82gyRb2xQoXiuMo4zVUbymE4ktcc4/hoXNtulsHS4VoWNOYfs45d8B0I5
	P1jdrVb5EcZUNb5HM=
X-Received: by 2002:ac8:7dd4:0:b0:517:8a18:7624 with SMTP id d75a77b69052e-5213c00706emr224130861cf.3.1784738222785;
        Wed, 22 Jul 2026 09:37:02 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:517:8a18:7624 with SMTP id d75a77b69052e-5213c00706emr224130431cf.3.1784738222093;
        Wed, 22 Jul 2026 09:37:02 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm1301150a12.11.2026.07.22.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:37:00 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE lite clock lists
Date: Wed, 22 Jul 2026 18:36:56 +0200
Message-ID: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vDRLdVJ0mPHrx1Z7E_PhZ_oIrPGOm-im
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX61FLpK4kWHV2
 yCJgSfCk+jYJbCko5qUu8O3meCjIcm+xq+UzMnh8vIueYg22LoHUYZORHT4xOfnWbfL6DwAghDq
 cYuLAtVqMpJqc30G/z8HnOR4nuFDqW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX7YgrNTfGrOlv
 uR8/OZTEsnHCAhDWS/WrQ/jmeUEO2YrsrenzqrWciZjnC9SqmK2/XRDJcpLKoDntuE9GzYjto9O
 KQMCNfjsz3Zza4isaYU+YQlIN/ccLbuCuPkhXamnOmH854cCHNm9A+2Z3Vsx4lgsvDWxAIikOP2
 OPoAqqpOT3uDUQHWWDNXFkhVTlnSlTpeE90+yPe96sJJO9oNj5IpedrL3q8ZXxfF0pDs8eK8R1c
 egnyfN7WEWfZx7DkZp3WWdxYkZEZHoN0zsRW3dw5uckpHA4cpLUaeeXG9qIQkECOQWvOro1+jE8
 ByYOPrPCqviBxB8bU/ZSQyB7Ae41PyRXVzh7L+PfbRH7QiCI+JWYwxUA7dPhDQtkYou8iFR5Ysm
 5QuCbhXgmFsQsdkaSjKtMJrF0edtNLLv4J0Lm9ubMSl+/fHhlu/7f8jyRegbJGZVp3Ju+cBdQaZ
 j24TsGWIxtnR6c7dcWQ==
X-Proofpoint-GUID: vDRLdVJ0mPHrx1Z7E_PhZ_oIrPGOm-im
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60f1af cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=CrPnIgjyx3sA7Z7sKlYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220163

The "gcc_axi_hf" clock is correctly listed in the clock list of the
8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
causing these to not work on platforms where the firmware allows turning
off "gcc_axi_hf".

Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
these platforms.

Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..3efbf2fb4472 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4037,8 +4037,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
 			{ 0 },
@@ -4062,8 +4062,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
 			{ 0 },
@@ -4087,8 +4087,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
 			{ 0 },
@@ -4112,8 +4112,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
 			{ 0 },
@@ -4137,8 +4137,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
 			{ 0 },
-- 
2.55.0

