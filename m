Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D6471D14
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810867; cv=none; b=GoeidadoBoh4UryopSu11u68paL4b66qXiEEH1fWCpD6OiSlG9eu1KUUqc31OE46mtvgp96SWxVSaKbqV9TstvbuVQKVSPHzyMC9yP7n1t6x1LqzUtQfmxFQuyTWJjy4UPNy/Ec5tPFEaG1F03c9oGrKinY/REygZVe7+PRiKmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810867; c=relaxed/simple;
	bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwuYqkexUo6rfAReuphxmj4vT7DjOBGld5yOjIJay/4Yw2f/vMO/al58PxS1+FkZCuWIC73qEhlb/u8qOshLeubu3nqxUF+gt4+sMwsZzfmfGfIlmBCtgFxHrpUgrH0SVuDACPFl9YKGuZ29kQ17JdpzIyKyEtGiCZp/bST5OQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oojfa9kT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQp9ld0d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oojfa9kT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQp9ld0d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qk0h3642784
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=; b=oojfa9kTzRfSbrT4
	FvY5z90bnx8bR3FyHBGKlwiCwpZpgiHic+E9h+r9d1xSEMgh0hiCy0uTnKoOYBnO
	yVBTWj4sKF6SCL8uTzhkDBSbLSbleaOe87hR0pLkwY0jy7DD5W52xPSarend5ck3
	0nRJcOTM096p0cShnSMUrRDXxQ+Ad5pdEF8hhEKYUw1/6MRYk5P3htQZjy/gffe+
	0tB6nhutd+pk1odIh+Jhsxnts9Qbino7YVBo/pd+Res5YdMdbbC/vFsPdPyLFdQ6
	Kf+gnbXKswHZLXAN9LBQwepJ71jsvXUfUSABbQKnyAq7KYINegcEbpC9KIBSJLn7
	xDb3gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha3a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:47:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso12843561cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810862; x=1785415662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=PQp9ld0d4jPXTFSlizk4FeqwF/xOXsarHiGnK6lpSH6fFZ45S6ZwJwi+VaNcTRahCZ
         2alYi5/LeqNu8gpSeXM8dIPSbJpGNCSS527WNiVP6aUTwIfCnF0Shuxu+LJvyVV+Ow1c
         uLcBgGWGDrIvaLAx7lhLYlllcqgYob3ujqAYDhmnjwnNQkEyF8fIe9vw2S5BH3xNfLYy
         8wqy+0bL/tq6p6T3O3J5bIqQOfUDHxYEa1FcyNhfK1A8Bd/WUbjVjrm48AyzeDELwMLw
         YF4+LlmP63PlywQ+V8W0rbKBd/4oojIrH5t+z2r/KLxP7lSiq9UG2ROwtgimRGPz+SZV
         etPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810862; x=1785415662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=Mn+eFZUOF4IOjGPI6O1cmoxVWO3xm3EvteESbx0nzyEUDz0WxjPSfS9/wONT2QtbV1
         s8QK0LcPDTEmXM+pFRGGAkh6+6Ar5DXQ3rGALJQk1S9RpnEmjB1YWdhAg8WbABRj36Oj
         CFCucEJk69OQ8MEPW1UKrvC7R56vKqBpkMPQ4PHieIf83E4JvZ+NUJflvTHxbROmls5b
         PaqnzYEdV1csqNh8qHRUfkde+muA2YK7B4ap/7KpEbFnNbxiyN4SjB2KNGrtGvyHi0Xu
         iZ9QQkKcdvfJlzA3y7WrEdhiMoksq5BD7/VgzoJz46wqelP31bHpao6cfM/8MoBqxwpq
         bLCg==
X-Gm-Message-State: AOJu0YymMzaShEnwepD9ymIgKTZeB5lG/zhXfCwnmpJTEpj2RTKk8yUR
	FQfElt179VgNbliP3O1CiYaw+UAYFYknCjHbRkpZaQHQvutqpzdT7ifQ3NqkK3H3yYMlJiFiNBx
	Pq8TBHmnhpVqRjQJ6CsZjtNffp75Ij/OWYfzOC8QIZGW0OvI+Uy6HtTuJJKWiCmCQ4apU
X-Gm-Gg: AR+sD11//vmiytYIGujhXPKBJhaCkDcUvfKODc/cG37ziqYMnzKmKj2VvB7iz45EVgu
	rrDr8FD65nKeCWoH/tbrDIpghWPujDb0hKQdqD8RphnOB0xriAmTpC2crgL8oUkjMl8PqX4j6k3
	I8lgYP4+SFbj4k3X2zrlrx6RKErFUSAzKq2iTlWuuxtaIORSlar/zHCiQ5pJefdwqZCIbLbBxlY
	twbxzBXjkc8kVQYFZ18i9ASgZ4TZxwPhif14ab++k2Iq6xST/i5MIQyLdxUhN5sCk99Dj+SsFZ6
	TrbbnpWpjGa3WCZQ1QSolTaOgFh6fejIYdHMISpr6Xbsj4jRf8IFjzerbF1/wYikHsCFlNrhDKB
	ucgEx9oLB
X-Received: by 2002:ac8:7f06:0:b0:527:7dda:ee5d with SMTP id d75a77b69052e-5283df10791mr22037981cf.57.1784810862042;
        Thu, 23 Jul 2026 05:47:42 -0700 (PDT)
X-Received: by 2002:ac8:7f06:0:b0:527:7dda:ee5d with SMTP id d75a77b69052e-5283df10791mr22037601cf.57.1784810861450;
        Thu, 23 Jul 2026 05:47:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:27 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-2-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1lf8cW9eBLNQVvtOHBOgkPn2TuphmlSsLM8
 Gau0GpSnJaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZQAKCRAbX0TJAJUV
 Vim8D/9IqhwbazjmdWICuNDfNG/4zUXFLCxEUjkem8JWSAoL1qDrhbgJlBb17npD2+AEAooZH0O
 pb3miQmI2vaIChXWbAoEJJnFBX0ZQJmtw+KCXpciw4t8yFfrgEa3ZSPdoOu3TS2KJdZP2xtMDL1
 QZt55Yr8GYatLm/B4FqGKpyzxYiXv5DbZxqDiKF1LlJW/xci9bwz6u99+4rm/YVApObS/X7981A
 wfEbvMbXV/qmFIibXGUOLRv1/mYOHdnmTE71DDeJK6lQAJ/YPhNlce0F8fySCdNw6UpqLxe+Tje
 DgChmtgBJDyanrP/PYcb5uLbX8ldvm8UyvFcieF4oaRvDIral7BVOnI+fhlTDnkyinzJIhaOGXY
 6xtCwjXLV2pNvnPOVj32gq2Vk/6lbS83evgxFhIN71A0lRoNRkgt+eCfpVp52l/GJLDFEY5ZySs
 7IXsQxPkPw22V3n/1MvO843fpGiNZ1WmS0AjyZZZDSfctvIXrtKjV/+SHgFnU/BjNQlPj2vZ8T1
 0elrxQAHkZhwxfTe32ZkMV0zACO/t2cQZqcC+/7fjyl+NCmGI6V1lI2/dNfQpVjfI5lILcEogPz
 4Hhgg3dw055UsJpka2qSuP/slC0/A+4syE/Iuyh2v5BfY4iDAxXDgWgZ/B4D7X8X8qBqo7q8Cbe
 AKYy2BMTNfliqHg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a620d6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xt0-Bjv7VVkE9-_pgJ1rWC80yFWQx9bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX5QuNjNso6ksg
 L5bUkemSAwNwBJrHBMdCOHZGyODGL3g+D04M2aXuzwKsAK52C+URxnIBlQBe2VaexAxekvR7RNz
 qhZbiPtMz15WhOsnKVccIqcHTv8HOIPmGwdP2Dm+ufC2JHKdqkEiBxADG83VvrAFk7q0XtWsKbI
 QGU1ctyecLozceV+zM4glnta703ENT+8SwDfSZ6inVwbdcrgxSxmMiM+hq1SEGAIc1YgPeqFvKa
 JUeqcLlrcGHW3uIUqlDPh3K1Sij6eaZiteRVJfNX7yV5aacxzVWJs1io4RCHYripTcQE0+wmgFf
 EA7/4q9eHCKYiF8il+6tdR7YEZA6Xa+1kHkyDaBTHyBwwwn2fiXMLw6I7MYpH3NZlRuzbaxGtrQ
 e2Cgvg4P2sD6Iq6OLFb2N4cvByS4huevgaGIRvFT9TmjEQ9amJW1COGCWnEr+pus/MBmI8V1qYn
 I9SeWBRicOySgHakA+g==
X-Proofpoint-GUID: xt0-Bjv7VVkE9-_pgJ1rWC80yFWQx9bq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfXzo+Ybmv/3xkS
 YEeolI/9JN8wuzVEyMnr/XVY4uxLhdQPACnWHTI8GhMH/MymDWponRRqTgwWT+YTHaXxve2i/S9
 3pkglQsVs+n9hYO2+rcL5gPRHVgYI2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230126

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 5abc23b9b676..c5a772b05223 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

