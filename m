Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874007;
	b=fZV6yPMqE9RGxSDK9kN4SGopezzxjAS8XomHrjxlckyhBsDPdaiKxy7dSinhHhVv2Uvx
	 xNIijIrkqI6zhzT/2W1ob3Bgh1Pf39avtSL5S8Xodtg5hTgEuU/KbIYmzDs2VFFpwOV3+
	 Mk7stmkGgUxor4Js1L8QJOFNNThnni2H+M5G//UaXF8l1l7E8s/tGrhVjiPTaPRz4b526
	 /uQXoJgJgdoCjd1kjHp1Xj0XHuKC083QQQHFyBBPTdNIIcXrGroV+NuA8Ak8TsGHA6tBM
	 oiDHPC9SicBZf7sKQWycRxcIvm60SQXCoij0Zk8xAq8NIGsqJjL7ZufPb9LY4fxqdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
	b=scd5zb2eSmDnoF7t/yRYw07Q8O/mG5meTsD1I6wxF1FnjoGARZ4hYXMJJIbtXvPdkkvP
	 y3hTMwxGa6WyhGwdF2lflP3LHZqdotX0P+rd59chUh+HOweQQQhimtLKuXGkYVs3HANom
	 ZQlWlSa//Yd1JSiMANQjWlH+99njaVzAgLvLS22VunqwQsKFstwTHa+0EgqDZXyVUHPQ6
	 e33KTwzocbXHOVZlE7hZ/xyctrBibkzjBiU8I3FDCQEdqV1f5Ub0uJWNMQdimajeOxVpJ
	 TglMBiwfWEZIqsNIoOprXcLYAcAxv/JLwsyqFeknysN/yH9fZhty5B44+bIuNwL2BxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnYI3BZe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB2606D80A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AB2606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnYI3BZe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tW614084645
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/v
	JlPqiL/I=; b=fqJTKMBhW4aavmTcQ0VMupvk2GhmzYCL2OcT6vje1EbdODUGgny
	DX0PylBe9xVUfhlz3yU66mFmhhZ7SjN5H/8gtFf61txmTEVhsbIqKkcO0LK5YdHI
	sPeqkjPTMhks7Byo5eFsHS/QNZ9itxzJRbcXSoqsZrPh2y3iMETwe7013a7FKNaU
	A4I3M57QT3wEyT3U8s061gEYyf8O+wIcY0SPvVuIH9SzbUzPWS9EqRjpAniLqmBb
	oBa+fhpgECJpZJ4cELFBaxGBslCVVEGDluCU5VMDIVs6tqf4ZeG/dNn78fXAf9BI
	X5y3Y7oSCk9pXi7WYHDYws8lmp8WMErucQg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr3sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:20:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so2900799c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874005; x=1794478805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=AnYI3BZeaP+ICk7WLC0cWYn8OZeLob+F1FojIxSGzwgcctKkOPROXPPYuUR1nUscRe
         R9wann55kivoWSdsPddJCmTHSWPMlvPISSo+NOrrSEgK+Z1mKwan1cCRVOSrNIfJ4toc
         UqEc9Db+MvFLnOUx2OU6hLfkpB+WlkX+6UbLgo70blnbCY6HoUZC+MNazR+DbK5hT2bm
         iQK1xO9mqSx0JzPzcHPmpwlkyXldF/oR4pWzWrHhxJ6OuKeR9evTkxiqO1xq/5kB98zq
         ZfuoWF2u/PSD/V4Vm8FzgKvlvR/N8gQx264eXVaufLUAsKkHRdWomtGzGIxctu5v+vtS
         3jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874005; x=1794478805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=nFet1RFQTfRaRd9DNwA0M4pVWBq+s0aL8un4FsxmoxUpURp5VsU9U0nFQMXbmkjITa
         g7ucxHH53xLSGPFjk6nuPqVqitEDWkA9xJDcBQ3zzuiBS8q+MKfkl11ERTZeEEe650Gp
         jN4t+pCl40vdgwUNWowU1q2G6Hg7/lx+SgxnU6+xT+sYheEChpE0Hf6we8RAL7SrbOCk
         hfkjQpG+A5S6s2bthKbFJ4HuI8qevePkse3Fm7PE3oJ8bCsx4HpASXOLF0CUwc80JBoF
         Y+JeR/kxAKbW8tRfHT39SIn2+e1KKIrC7BkbI+1m0nqLpFl2PvxyIWUgNjnJUDhHcvOX
         GT0g==
X-Gm-Message-State: APuU4Z8+Idlun7XjlJN8BG0bTIKjuNfsRRpwg4rAri75oeNBD3U2Hyir
	rkg8Dv0DT0Xbl3EFyXemCKWBt3nsFWtfaLIgV54KL8Gqd3g5Uzbw3zODxlJCGmKCBUGioqF4JBV
	ucv3xUaOqWlu7d4UuYEwI95DbzFPvvp5+3Luz96xG53UnIQyWnwLPDKC0RPUqhmqJD203
X-Gm-Gg: AYBFou3peP1njaLxifgQgltZZpw8uXGDxxSMK/YtLRzT6B9yHCVvf13sviSWhJVrO56
	ylHNQIVGsIZeIZ3Y2sGk/DWwToA46Uq3QfHb+5f7yT04n+PBXEdxAjpP4FBfBUXK1EiNiTDmG9+
	mab3JdykKIJOIiUxwmfTrrucrRrq7eEdffDbrS92MzrjeVcwTPbz0XIhweh0ARhhddN+HfGxj1O
	Avgt59nCEasESKNKAdrh7LAIM4D7l4baWweGCymcD5YiwWHIjKLgKMjw9fKtsQvDh11oztsdF6O
	B6LMmgji4RbfuS8t0u7K7kmIharOHXDfLpvM2GnFuVZdoCGBJcs5dnakOE+i+o8kRmV/hwD9S8d
	RNajcPXycfGt1VCif7IwPLECoscsnmf6E0pLk/Fcxk1IIMTFA1H/gwoZoSX7Wdj/g+4gUFmyxH3
	oJ0uldB4sY
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354565c88.30.1793874005155;
        Thu, 05 Nov 2026 02:20:05 -0800 (PST)
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354538c88.30.1793874004436;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:03 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V6 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Thu,  5 Nov 2026 15:49:52 +0530
Message-Id: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX8rxbVGyXmZAU
 CdustCPAtterYaMqCeW24LB6QbRCCvkyhSIVV0tLggKc49IRlBWN6dkVkga2gWe8XglonIYgTP3
 nPp4uv8/Ev68VolI7gDd5/V3oiAIKZ73Lm1D2FVVEh61NHD4WzGRQ8FBqu7WWNon5kA2YJPsCfy
 SVfGsu2APpxGIe46WQVpGBU/XV3nlYB9R8k8mxfUGG0kQSYAbOPI0+JP934dAoy0tfGPpq1yDBU
 m0wBat8dr0nXp1674Uw0D7Vi1PeNoiwEFBhrGWZgD8GCN+/MkHqedNpb2v8bRueThgCrVy58N+U
 Sq2UV/vtSDmnX1vYR7zuslVhHdtmLzokGVecHb0VJgL9I74cWVhkkiTRyWwvza4tMRincmWJAnY
 dGMEcWvW4lwGIhZyWm/1pnx3RV/+YrHG+eNROFK3z+DCBbrG/H3LW4h2vJK8ppiiOGQyWymv6X/
 WMgLGdwp2HXnc1BZqzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX/mxvtm2v8qE3
 bBL48PO5iB+FgLUeZ8EgMn3fePp/nY95P13LCC0awNuPAxjQHAa1zqlO4LCcyhtjgxVXrIcgxnJ
 RYqF2BqvdqSuzgLJg2I+CTNvIkOjDqU=
X-Proofpoint-ORIG-GUID: 2m51ujqh25yyVosef6A6YGbTjgzQ3AVH
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5856 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5OXD4evTFBxQrppJ00A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 2m51ujqh25yyVosef6A6YGbTjgzQ3AVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

Respected Maintainers,

This is v6 of the Monaco SDHCI storage support series.

Changes in v6:
- Propagate Reviewed-by tags (Konrad)
- Rebase the changes on latest tip.
- Link to v5: https://lore.kernel.org/all/20260826112456.482982-1-monish.chunara@oss.qualcomm.com/

Changes in v5:
- Rearrange the Makefile entries in alphabetical order. (sashiko-bot)
- Rebase the changes on latest tip.
- Link to v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.


Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  8 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 109 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

