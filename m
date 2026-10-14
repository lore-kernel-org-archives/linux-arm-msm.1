Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2744C650A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993391; cv=none; b=h4shxyln8/OAh427h3OFCr7vQVvV3ZUwwSHx+YMdcuNMPN7z2jhqqy7V+L4mIU88mHZIgHJoCOEx2toYVaASIA32Zy8t5wldMMmVFWeAHYUoj4NMo8cWHr1kplc4qhTWUelnNxbXCBVMOqykTM81kmnS07wAQgPRRRCdx/Xlr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993391; c=relaxed/simple;
	bh=QcP01yeYANmnSOpCckxi4SHgUGs/ns1aGF7CqSeJ3UI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ANMvQA68wqhxriTYNgw+XT3LsQdiC3dTg7vGGe7+7K8KS5amTal9e/iNG0U92qxCAaQgSjXXhElqflfs5Fpy/s+n449ha0Hu6A57Mc0eq5VnRto6tbeQAoMPWFF+k+RfbzD5cxexJHBd9ViotlGNghrXwDG9ZXZOWgG4bs+8bik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvjzfRk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QytRT77g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvjzfRk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QytRT77g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EF4IQf4167121
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nRN5mwPXK5jua7t9LUgDQO
	MkK+R4yZYyk715f9CNhO0=; b=VvjzfRk5J6Z9CkwIJwodw+ihTsee+ukv63IqOX
	Q6WCjbh4ntyQsNl40UV0YtscS8XbHAdRr1bSL5Lwkxd3jYJQPOdWAsMF+a+byAjn
	35O78uSyLMmGd+S3EukL4LU1QVoUfA12dDj4tlsGrsIO+mHvy2h/ZVFhFiSukeTS
	/5Acr0uNCgHGOGLKOD4cwQwAiEsEXn1PgSImFhcWwDYowpNtjbqbzh7eX6aqwZqw
	8vgCAyuoLnXxJdI04NgbxrW+XRC6Gke2cjuUNaC8UNVrSr9A3/BXMS+HiAmXJ7uz
	XqJT2pK4mL6e28eD/AIb7o8SWS8IbWXweKZyKtMVnlRUP8gQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac2306k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1576334a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993388; x=1792598188; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=QytRT77gqwzicTMEND7HlPqRJxliLZ1VBlxy2Hy/WPq/u7J7vSXtcr82YPDl280sog
         Fpv5o30+Vr6bSap19WundIb8Od2plvq6jfrgtSDemoKVUZH5iYRgcciqtNC5HG7TqsLC
         xjmtJqJds/gJup3oDUCyOl7b1nLjH+Qgm3sUpmxZLfWU/wNGz0Mx0VCf0/9a66W1RxJQ
         3d854c1SGc4hc4g8SRRaj+Cq/PRf5FMSw5nGvDpyp/TuECqeYPOnqHc7AvyI8BaMt16s
         QvuMv7IEBkSyUc8JMkwJ9JzqauxFkSaEVpkQAwwuWaOezEenj1OmeGZ08jb4Cx1OTqbM
         2fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993388; x=1792598188;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=h+Fz/Lwn09ePWErYyFCDYLcP4qqXFQ/+gSFs6ZtDtq158L391gqT3WWfehipxp4GwB
         OlnSdxhMHkjxlZanAVaEji1mztI0Jf/uyqizL62TrameuUs1kKMubcCpIww19uHR4F5o
         UJMnSNjMoWqr7gaz+yas7iOjRiS5+8B+XSnxv8EsxrRVRmbE9c1lFwtgJ3wlTHJ88MXU
         gWM2+/MC4G+rhm2p2IwYPHelemwu21axj209ez2NNk68yxTw3wTai1BAft9slPeaQJAs
         e4+dPNGJXXrzjQGn+96NTwQhzY3MRvza6FoMnB9ZjXXRWOLsO/O79LJgTO02A9d/tVtb
         3HAw==
X-Gm-Message-State: AFq9FYJTzeGBKr8Xr58f+0HzjD1PODsDf+mBeSSkg2JNiz/IskLQydPA
	4XJQXrRTEO71Aq5dr9hInWATYgga5FVstonaENM9EGSzc6MRscmuAej8zziYj+JnvoiaBBUcI7B
	JlHq/n3gXA9l+QmWd2yD70xGdFZQTJQiC4mSW3cTEGGg/ey0TeYKuqP9fE+S6nGk3eF3j
X-Gm-Gg: AYBFou1mN83L+GRAkiR3QHD9AykIN8sMeDiWjwmSMp1QuMk9Ceqfn4aBeFqH7PtSVFq
	ImZeHRey8Gu3lQ9BnZR17OA9qhvQejasn7KNBDFVI9g3AXGGgNfF0Hxjoy+KZWZvIKS3Fevob++
	xN1zN/bYjURYZL9ZQHHgTwpP9ANTzPFyqc+DmGLGeXzRAT9nxp+lGAirj0IUZ/WaQm2GsnSScDB
	LQZ0JbyOAa8Okfx+44uAOStDTbDr22B/vqIB44GzF8oAgmYZOFdCyodRtcXagEj+C+SP4myEWtp
	F4NsDOD2/TFF5eRrz37mnEOJINfNm6tHWu0cwTsGHQNODzRt9hl5u9mdXWAA2bR1sAHmtGaczMk
	rSZdHKB+eAB4DXaKm2+iuI/3okchZ+bipKg==
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158859985ad.37.1791993388078;
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158857925ad.37.1791993382906;
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Subject: [PATCH 0/4] edac: qcom: add DDR DRAM ECC reporting for Shikra
 (QCM2390)
Date: Wed, 14 Oct 2026 21:26:15 +0530
Message-Id: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+mz2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3dzE4pLUIt1EM2MLwyTzNFPjtDQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AIWU//WoAAAA=
X-Change-ID: 20260824-master-a6381b7f53ff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acfa62c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=28_99TRhucPTTWWXKPwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX23AeQ9QDFAtJ
 rD/ZddwX7F000+iEOMLn2M3Vx9QnvsOwCDnRAFhwBSNHIBkeJDdbd9nZsWWTIAWFhSC1Xy/wbMu
 JWNn5MT9OsR7GchAwQh+LXUNwaqr148=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwGynlPXVAL+W
 q5+MbEH4MqKg2xg3pjsV1/uikXweNo61vQMaop9mLSs/3UO5Ih1tyWNWY3f9SI7XQQOC25H5IJc
 cz8DtsGVwcwDm42plx+3/UnfAIPrA5NWLwXO5+6VYsaKDJRdVSS3UL5KBg08Mk2VxQE0LiihwWT
 4nLtqbG7oDwC3bVEQ5/A4ACIrLLVe/W0hFWAma9lCrkDZuILK+ZdhgQgq/EqXG+AWR/HH3DXSsy
 wsj2lJ9qp3z47HnJCty62EYjH7rCCBfUMKFJL5UVQCXOwkXd9eoBZvARoAdjSxtOKRx+oAOU3Z/
 fDljRY509H8Sk5XV7/3dxL/d8o2m1TOmOl4j/3DLFVSeq5+2UAmUFjjfNnxf4psHz3w/yNkzkXj
 fvA814OvpIduPr+ZMs3drcXMp/jBr1pq759jevatNDZlkw2WgCdYIWEFQ4I3oDOFwNCiLwysTaE
 OG/uS2I1aCbAUb7a/Iw==
X-Proofpoint-GUID: udL8XwcRCEMBkYImTfZ5Ayplo88e5eBT
X-Proofpoint-ORIG-GUID: udL8XwcRCEMBkYImTfZ5Ayplo88e5eBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add DDR DRAM ECC reporting for QCM2390 (Shikra) via the LLCC EDAC
driver. The LCP/SRP block between the LLCC and DDR PHY signals CE/UE
errors on a dedicated interrupt separate from the TRP/DRP cache ECC
path.

Patch 1 updates the DT binding to allow an optional second interrupt,
adds interrupt-names ("llcc-ecc", "llcc-lcp-ecc"), and enforces both
are present for qcom,shikra-llcc.

Patch 2 adds LCP/SRP register offsets to struct llcc_edac_reg_offset,
populates them for QCM2390, and adds lcp_irq to struct llcc_drv_data.

Patch 3 adds qcom_llcc_lcp_setup() to initialise the LCP block and
llcc_lcp_ecc_irq_handler() to report per-bank CE/UE errors via EDAC.

Patch 4 adds the second interrupt entry and interrupt-names to the
Shikra LLCC DT node.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
Faiyaz Mohammed (4):
      dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
      soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register offsets
      edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra
      arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  26 +++-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   4 +-
 drivers/edac/qcom_edac.c                           | 147 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  45 ++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |  13 ++
 5 files changed, 231 insertions(+), 4 deletions(-)
---
base-commit: cbf6c6b201561342d673223d1e59ef771c7a9dbf
change-id: 20260824-master-a6381b7f53ff

Best regards,
--  
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

