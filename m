Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA047728E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246464; cv=none; b=eBufzp68mIzUPlAMkrWj0zAc/uXZCPuoUQROQ0djw9AOsXOo9kLnPkJzE7uiSwGQsOZSY2EmL5Dvv3Q0BpE43ZbQT407OwNoVqutOKG0BjCTp7T7QK48O/XHRlk0BjpHKdlIk7d4T2A8q7rTVyl/GWCNXRfbM5/deIp5AgH/e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246464; c=relaxed/simple;
	bh=qBlgGkeH8wNKY01fzcMUBiFwz+9D3LxCKgHff59hJF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DU1bAkrznn3i4bH5yajvAq7zyX56fcws8sOvyzHgX3nNhntRUwi0GSkACFcPwESVmEhOMWvJFrxVZFMBCWae9DasGcllv0vIj7CL8j47ozcPeTELLvL+1PN+8GWSUEXgnodfhWJR4L9vHY+qfT7FBE0Tccq2NuaxjEu9JUAhKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFWkCJBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6NKM1AQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFWkCJBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6NKM1AQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDT81923949
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=; b=CFWkCJBka5H2Y0oz
	xaKvtdkm2lcwaUbEYAb8zaIA6wV9ws+18irXLNi8HDU3HjLDzD+amenrExPdaIHC
	aHaKmysRubWbfVkrkvFKWcd3f7RaO1qTRCp3YcZy5QpUXam7LoitfI7Iu7tqhpCt
	ukf5x3A3EnvnDwgLsL4PpXsZmv9REfbFui8fEKOC/5PRS8btSfcZfeNv9Lk+W4JM
	Yt2J1cOf8Yy8mwIwvGe6rNxrp5Lpo2ZDqr9+FxMVi4c+/yBxi+bJZ/PW391QbHOZ
	VWBVdsPAjVfEV2cwKMH4Nlo3i+j1nI3+iTkytkCFtlT3y1n8c9XJ6WhHY0LVplbF
	K1lrvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-912054a1c29so21167206d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246461; x=1790851261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=;
        b=D6NKM1AQIgstDrwFwPvOwH9kaQRregYvBhnRqPvdMNBz+QiefnVKTRFZ5qysCxA+Ee
         3/3HCi7PvYX7sjM1vvyWgMFoKT/nYXLmyNKsGPoBHq7cxOAPY0Pd/MhM9y/lUTeU2CXh
         HOI0Gh1XYiKWqdTnb8+SRmef0hGWRxlHsRvcXd8knX+zPsmTECZUIqrwIQSH5PPC+ADx
         0Med7Kq7eim7y2jvE/Gsyp2P50QC3es0G4Vs/dhLqNQypU39wjOYWOugX82fZGT5wi4j
         kE+xJjGksFOc8QO34PGV2bHQxHSVUB8IcsRgfcOXwk6vMrZeD7mD9vn+ejy2nQ8YTYnL
         9zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246461; x=1790851261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiPGKX0ujiDce+OGI+2TxDbClsHesMw6sCez9hebei8=;
        b=qIau4UE+BxVcTTlWpdPPfpKMVaojrpOF/LHw5fSlunigLHUYjgJf17afc/F0K3Py3H
         ub7AUfprNAaW5Y7y26yjo82T2XtPQCco/ufkYASp0eZmSEv22objA3LeXIq4gXyQisf5
         xKQx4v2/cFKqbHrEvzZtVAz1OyNbNwW5c5LFOT4q/F2cqyYC066BTSOp2cUkh6s03o98
         bTKn8AO3Qb8b+DGJJZz0GuL7COjsJgDzksbdVU9jNgsZUXrw4NfDQtKbJ0429GqxkXaL
         ifIOvmm8GsIBkaqEVzeLnxjExv/4XpUm4uTjiFtcvK/ej1MvZCSdg6wx80nJE9ZcpOW/
         SnQQ==
X-Gm-Message-State: AFuF++m+VZnt++D6G2nIcwGqWVWC1mK0qkvOFEhU9lsfmjyeXFSmig4T
	7eOeXebV9CffUXbYWiPrea4GJAGbpMM+r5GWMz05GgfmR6eODIGXt1Iji8gupckeggOk9rESJlw
	FfvZcCqXphYIKBF3RL36GuNFDD7pdDEWLv3JWdao+hbrDmE2ShyEVDAAYZ8MYLyGxNUW/
X-Gm-Gg: AYBFou37jEVu55rBe9prfgjel+Zvm2LxOL+/e61EhYyNCjpEeweNBemE9lgiLwwGN9/
	pRJNm13igFWox+fehhrOmLRLd3MC1VHLHz1++MOkOGNodxlB4SUkp6/hKaTSIQUOlK3xUNFREN6
	IH2hWj+3Zh3hwX1Gl6FVNHPYZyfFXFG/bjwHmcvDNXZDUwTyzcde5OoQHoFr8GPzuN8M+3AIts2
	3t6yiIt71i78exM3EOAEos6ZrGfoYU2ewRRmO8E/gJVb0a1L+5+UYE+eC02w6XL/dN7ZRll/sW7
	VzDila64ePEcehA8thVKtTRGktZ2nILrCboRi0YhDTL/koWdvNlJyBqWowUDMyy+XsELrdxAcjs
	l9jcpg5MQ
X-Received: by 2002:a05:620a:4890:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c362a8a57mr213918685a.23.1790246460917;
        Thu, 24 Sep 2026 03:41:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c362a8a57mr213912785a.23.1790246460222;
        Thu, 24 Sep 2026 03:41:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:34 +0300
Subject: [PATCH v5 18/42] clk: qcom: gcc-sar2130p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-18-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qBlgGkeH8wNKY01fzcMUBiFwz+9D3LxCKgHff59hJF0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3rjV6bJDJZq01HVWro8gHjpi+fMzFtRkh5k
 KNp4Fb4I5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96wAKCRAbX0TJAJUV
 VvkuEACHu3+B5rNY45vtpgnqMEE0l6+rTBgq28+9R4voELE0qGQpzQ9QTnYeXSyH8sTmaTGg8RM
 s4pGyj7vSdu3/r0FUlebSNeUeAZI9X1XurlKKe1eA1rUPKDLHYOhU+0zsNQUkS5TCAzpYX6PYfA
 wp0rTqpI9GHfhV8Tp92ALkrmLhh2d+EDujpuIfIWBDPfm/as5QZOdHVTXxyWKUNdnwvPtaGpde8
 aZyAHRNSedCTnV8Zrcr8hV0EDoJP+4uN13mFmelI0P2kFrqCh+43ZcVAWbqgBPA13aCmLg4wvSO
 F7q+xQ4oardQcLw7aSH/vZHTHr5tBBJOqzACY5v7thdMCH6kKmJA9NNblvT+TwMGcyJohmjYc00
 i1YrLuZ45EbAbab1EZty0ltw/HdbeP4Tb+eAEDR19Dko9f+2satB676S0yOfY0L1vqmIrqS+fqq
 sk94xV4VeCugrWHbNn33owomN18gkt8k4H5+58NxpkZMdsSkKML1mhTZAsRiMnoqyrdAX8R0qGH
 EmxrX6rsJGbkUbTju1ufq8gPefmeHlh3114iQ7CvHBFbSHr6Shfw2hzW+yO5vBgWNosOOuueFN+
 3PtpILtUDvIyrN0TNKF25Vra7wiN6F9YLwSmpMiPfBgIA9koiJzGBYD05xYCHF4Rce/vMfYThzD
 b2zRePUuTBP7Z9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7i+XtXC1wbVK
 L85E5h+p7M4h6lNh4S2XLWMXvhhnHeWIDTqOlMwgCW+v6Gr7lPzXIRcvx24gCw0HBZFbc9I20+i
 uvDNY8FvO6AE9X5/oCSphEXX8z5qRT0=
X-Proofpoint-ORIG-GUID: m1sW8LNvP4hsdWVZCkkIjXh1oNaPicGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/2lXVWryZVHO
 aS2V5uhd1Gfz9tFx1FrYcXd3oVW6Fv/viBD9YG0yXAQuzaqzXtky5MPsn1GgYWwYgtTzhvnUEQv
 i8Hez//iALEhNuENWbIgfDMSESBAOEOSV1eS/N2qiY132g5TuiNHse0AGnQ5IWTMJU1Q8OnEq7e
 gcWpoEnB5D4sLcbpNNm7olPiQnpNI3VhWz5+VyaqxKRxO67N6/uITls997g3r8kUdmOQywMuBh5
 m7c31z6BT+c/yzBbycxAguon5utruXXRONTcfq1beOJy8QPrbVKJWQbmLT17aG7xNfqvTJ1+eEb
 mQTlRfamkAybKm6mVvdVlLLhmxkUte6czngDMUVkKVJwWSPQa1EvnMy2LvetAAnAy/1u2sgZ4VK
 IvSwB6R4VhJmpZjRa4PEocv9tHVZxxIC1G0hQuPYjMYfowSj6BISTpSBPvY1dxzrDe818jKGLWO
 wd7R44Vw+ojAK1oMvTw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe3e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: m1sW8LNvP4hsdWVZCkkIjXh1oNaPicGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 7456001cf25e..7a3478a9ffd2 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sar2130p_resets),
 	.gdscs = gcc_sar2130p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sar2130p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sar2130p_match_table[] = {

-- 
2.54.0

