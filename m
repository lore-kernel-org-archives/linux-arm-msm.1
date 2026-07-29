Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22444457B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317705; cv=none; b=mpH0AdSrbsin2ss5uuyg8FN0bSVO44fLBHYQCqYCT9m8wsEUlDxX8WkemAZFI1/4djDcPX5X+Ni8HzAUaZjLFZ4X5Nk76y0RCurDNDF/aiqcrzVhjOGkNrVxzgtVtANODZCTwbE532pS+VCGcHmUh/WVlq8rY68GI2Hu/OBaU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317705; c=relaxed/simple;
	bh=Paf0xKTP4o7te7IcJgNFi9g8u5b1XpJ5BzKiedS9tnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XQmEPXEXC9NY5DfGcyA/mb/ES0VkNuOmmaQCagmFjxkgASsiYk3QuhPor7+6zTAlZ0eVATuw60MNcEc74u0Pm6Yj5oeSBoW+GFyvcMyAa6MalBZm2ZsJ5mAk+/Ci7+tCD6630K/PZXCA6iVyHMscCnsTe6qYUFH3/Bwc47gLfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWSIB/O7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/GCtQXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWSIB/O7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/GCtQXs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f2YY1088701
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CaKUne+ADx3jTz+HT2Uot9
	znfOtd089pGi503wDFNpc=; b=VWSIB/O7oMStjlZo3ILty5NtyavBMac8nWlaiF
	qM8z06IJzerHL2+deiyXTpkXg1jvcDXhYsX2covG6XiAXDkLzH/eai94eFUApa2j
	PHhQMAY/RfS5OqF1/GzlJIcdrTYCpsjMlbKIi0BByYum1SN2/yDERku5NEJKen5g
	nZUWMN8UanvHmUdIUIMdduqQMyxjixwhmmbIxDhdtqOG5FKLI8snhbtxhNbDTicp
	psH0t/LaSsZubxS54JhIta5SiZ1bsXjoBnN0e7MLOXB28wHLfYjgSMv2aGfXJNAc
	VX5MdqOFvSwEQXYxDDx3q5PO29FcgMd4E40aNSKAzfg/HFbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5saj347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:34:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1659120a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317698; x=1785922498; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CaKUne+ADx3jTz+HT2Uot9znfOtd089pGi503wDFNpc=;
        b=V/GCtQXspfrPVItKSC/gdaBIHfMXn8WbDSJ2+ilHuv04DSe+HAJeV8BagCXVjRFjH2
         /u5Osw71GlUPgodK105YIA4vJCwifZwSCWjEGq2CnV1li1MwmmTSgBEfr4F0dS3+wMVg
         VbKZfd4eBPb+vgEttatNz9IGTUy2Orh6wMp3cL59dS/9/ZQvytdrCdYoNwU1Syb/pRK0
         QLDdsM8aN6Me2LztbMZ9HyoLjNFViy3rGXfwdNKU+l+ZtqpFO8W9yLRSbXH2BerZvol1
         TyawJl5bUjM/9GLbEqIn1ehUrJfYMEzxXGbrCO/vqgkSjHNFWI1KMW3suNM9lI48u/F6
         9xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317698; x=1785922498;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CaKUne+ADx3jTz+HT2Uot9znfOtd089pGi503wDFNpc=;
        b=OnCjveh0er0okBHrbZr8Hnx1MZM8bOnxKUNmmfc8x1rwYVllW8VdJP0VnMR01q9DZP
         hVCfs6yXgKUOFogifKKi34vNS0aAlTKRA1jq/7+ZOmVDU/YIxTv1Px/6iQXa8HoOha4k
         /P9YHqXXjAOYV9bMks3enhqTpf7+2r4hDsP/r8GXZXsYLZhXzCaYCYlxk7wjgYVgAzWE
         +1X6zD43IC2a542arVP3pAzq5niVGEU8YLSl7HrAj8dW+D19a76GFIpkdQrpNsIMKV4o
         la6IbEfVsCGMrYiGTmuxNMFW5tM3D8FWuiDMyMcs83ptubYoeobkK7Z3XlPdqSlSxjpL
         J9/g==
X-Forwarded-Encrypted: i=1; AHgh+RpDpvX84xBLhgQopJt8Hfk+q3IGKuozuEQ7DCmmO1WUH2uh4EXddvjByAcuHftu8o3dsLQrzVDZeZpzpQec@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+r0R6GsHLxg28rVZf350ZJuEQTS5SN72VJUvky+YLxnXu6b3
	8Y6QJEZ8d1hfMjjfFQFW5ZSY75y4Hv5sxv2VEZXN1VrdSE7sHU3O5BWUI5RzugZE0ExhHlUiaea
	cngY0kofhvnERG9OEtltBVRtYIeTfoL2+XeXT/4G+OiNI5ueyGisLAfjZLflkDzLfxIW3
X-Gm-Gg: AR+sD10RajPyga1ilWwX2iYzS0baRcjVZnJ0iS13DbGNi5OnbQKSpLf5tJeKOeSsSeH
	DIPs3qCUDWI5j5U0ANnj3j8m6QT09ziymtEb88rwtEaeie7S4Tk4XUBwZvAWAcksys8lmr7r+e6
	P6J+eN+573+fXzSmehzrk9SHQSekzgrIZbuK0rjiKaBOFBVqTMtNVz7XAWNAvVrm9xZ9ZvCIf7T
	G5kriDuf8Xf2MEOX3644bRnxNLopGQCisNVa7ta/puirNaiWaGz/9KPsRzyYwYVWN26QhAPnMj9
	J8sicIgRnTGlYbxlj1YdUNdgtDDpTqsCudgpo8GTcILrVI/x3xK2W3YWh60zllpwQrvYefZsZwt
	A+lygmZqN+gZ+D/aQoLH82bY3DG9RgH6Rf71SbEL70cvb7dYYPW01Qn2GCRGodiU+OYfI8xFTlR
	HzSjLzxdT/MQFKq7eNZs0xotg=
X-Received: by 2002:a17:90b:1806:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38f6a40bd7cmr6708948a91.13.1785317698109;
        Wed, 29 Jul 2026 02:34:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38f6a40bd7cmr6708921a91.13.1785317697623;
        Wed, 29 Jul 2026 02:34:57 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504e1ff81sm8243634eec.31.2026.07.29.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:34:57 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:04:40 +0530
Subject: [PATCH v2] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC/JaWoC/32NzQ6CMBAGX4X0bEl/FKwn38NwoGULNUKlhUZDe
 Hdb9Gb0sskks/MtyIMz4NEpW5CDYLyxQwS2y5Dq6qEFbJrIiBFWkJId8ahsj1sYDPaAa9eHEut
 SckpBCSg4io93B9o8tuilerOf5RXUlErJ6IyfrHtuq4Em7+9AoJjiPW0Y543kUhRn630+zvUtu
 n0eT4p+CuJnQWlBNDkQpYn6LlTrur4A4aMP8A8BAAA=
X-Change-ID: 20260728-qcom-geni-se-armv7-f7b311ec9e63
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785317694; l=1423;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=Paf0xKTP4o7te7IcJgNFi9g8u5b1XpJ5BzKiedS9tnY=;
 b=u1aeqW3ofN/vLb/9ct0G0uHj3SOR9IxKe665ps6JqYkmyiKrBOlLHnU2bIL/nfVmJ666Qs++n
 D6PrL2+cr/ACtGO94C78sbOov5gxNxeRABGtC5zFA5jALVYcGaCyBk/
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: P7gOUdBp8JrKvbwPiuHyr0aKvHhWQotj
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69c942 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EBjTWYSWYZ8WbdhEkYwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: P7gOUdBp8JrKvbwPiuHyr0aKvHhWQotj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX1XXXCdkG5w4T
 /QWcmVX3edxg2ZG+/3ivZ38yuhSP2+e+19Xu84L/WRqciXBVOMCKzWP6i63CkW2PqWj5gRDfrSe
 V48neNOf5raU/ig7ij03zGmT/PzpQEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX7g1RNavhFBgF
 TusZ9jMcGn7Pwwb+KG/JSJTXCXt/e+iw4AHTbEDzsHHw19t8J94HdC4//lLXEMQqQWE3lleosid
 KQZaduFd7lztX2uFxTetME8AihpNtRBXxUDgWPW6gNql/5hl84Ii6hn/RPgM5LNsSvQbZB61S9l
 I558XM0uk6f5A6cFzHKT5b3SRZxlu1ttTCmGCXwWZDFz0z3ajXXd5nLepTcrekeUd+L9RNc9lK5
 qEpxlUQaykcLLLAPY2nU2eCf4IQmg5LdmTnlkfeYZlRLpXcHCRyovlAtwKxTex8pebbVN6cHVvx
 ZKZWCAaI7FnNB01KlDy+pHKCIOGiniWIOYFXPyQPWrpRikuH/RpUvWjceQT/6nh4nItoXUsD/M5
 ank9FCXRkWbcZL/7Gl/2FTj6GuDiWyfkNT0M7hzNwNUV48430gA9G+XYFepujV2y6eRkZzn2ag8
 kUKTcrGlSWrDgrtNlAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290078

Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
hardware.

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART, so this assumption no longer holds.

Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v2:
- No functional changes; resend to correct the cover-letter changelog,
  which shipped as unedited placeholder text in v1.
- Link to v1: https://lore.kernel.org/all/20260729-qcom-geni-se-armv7-v1-1-cf90f050cf0c@oss.qualcomm.com/
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

---
base-commit: 9c6fc9be717cf3558710a958d0d16ab9c39314d8
change-id: 20260728-qcom-geni-se-armv7-f7b311ec9e63

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

