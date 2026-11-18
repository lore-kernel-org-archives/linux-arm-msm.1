Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985236;
	b=1ZUbPk7fRf36X2zQzl+qTgfuK+v88skxxhYLlng62XBlJLrsGDp9v70kh1ZCRhcegJy5
	 sqB375m/AIsOdv5hUhH21lfcO1wJvZTOwY+Z8iSCRoatYvK+AB8tgFAEIOzaWskng3Rt/
	 cT69gJMwRcp0Eh5J/swsf8nPAwUUo+nf56DWHXpSEiduOnFkDusdnHlkxwZ6zV5jAfgGt
	 jEyrpWWXHkt5bWROsuX3qETvSDCRpJ3q8mh+pKPqXdtoQG3Jhqbt7VYx2FcP5dKj34Hya
	 c+QqTFVY/G6fimaNZ2Ughy9Ql69yWy36ukk0daALLBx2iv2UAELNlweZY2jTmnWhpPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
	b=AB3xfU6z2sBM+MMeyonyPUxWD9moxZpg5gdHshDVnR4EgobeaPra9ZOsQYrHEDSnCwD6
	 xY4eW4k2Zo6sNJdlv3v9ctLaJMGsgrq47A1xUDaHVv5/vdxK6JEIgg8tC+X0DRV8lVwsG
	 9eEUuO0Yx6aKGX1svTjH+GhL/U9uyzLCHXgKWA0rdFsU7yIvXS4SN072fUhNfRDveCxKU
	 sVlM6LyJKDgnXlhCTwYFi1wra6rOSIXI007dzVylxWi10Swn0+vVa3UrxbSzPYY5+DCy2
	 ORCnFv3jEWsGq/ql3jlb0rdjtms7rsPJRfKXL6/kYdyLE2/bVOug3YxXet4dc0ak6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="e25Sv8/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSej8zOO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA5606A880
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FA5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e25Sv8/s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSej8zOO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2Nm764095
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lmQuX0S5Uv7E6e/YfcFegv
	af4/mz5xAzkdHo6Nu6EUM=; b=e25Sv8/sUS15LHN4PzaVv+Ta3HHyPsfw26WWaU
	U0B1UimwK/jCylHBbX8P5EYaX57MdM3Nh75b69uDsFcGbyBdI6+CeKbIAs5HP5h4
	QEj66tRs/GVnmfvHDIaVoEWyX+biEgsXi3gzELjs9k/310+XjOhUiiT8hNvu27aH
	BJPJW2258UD9AFSGRfNRHzfE+MEdqoi/wwTyQbpJ/SbdYWrdc9odaC1n70hVZrgm
	pHefravj6SRyYb/6YQhID53X4iqzT7Ql6yvnkcx52aQyM/WP5A+FwvdK+c4sqe4l
	hNSDeew2pr6NWXD2YTcUAWwrKZ7Glj9vu50HGIXFZrTNtyow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9pfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:00:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso752984a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985234; x=1795590034; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
        b=PSej8zOOdHKXlutB2VHAXHqne2aF3gFDAv4+3wTivP82iKYHFO23q/aAjA9eAPLN/W
         4+p9G9nEvAi2wRD8ffAf8EL8/A6NYVwVzGl9tjVMhzqdw0ruRp6SIklB7AydfvO8RUZW
         0My13XstM6dUt904HjN4kzDU8BP4zZ43TDSFarJ5tMLe1UK/nuNrvS9a5Fn2naQ8pTLx
         lsYaxQ6D4feCpf6pjlTqPc+WHpr07YiAWee7XfPaSBfdPOHffLAU3T3AYc3KTBUWhCup
         DpaxtLFDjX0I4QhTXiPkdPmXdb9KT4FAYh3pujSRzbGMBPnNkiUEpkRSRdfT+FFP9FqG
         D8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985234; x=1795590034;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lmQuX0S5Uv7E6e/YfcFegvaf4/mz5xAzkdHo6Nu6EUM=;
        b=c3/sWitq2OzUo+7BS+zeNo/5wO8YgyuTKgcXbZKjIXV7qUm9FEKWZZW70N+BlPTUnF
         dT+yDlGnALOhx2m6yrWUCIE7HV4OsgGCdft1X7T1RrJI37FCEuMfexk4MjAwEIqhdeVc
         knltSbAKczJpu5UE2ti8cqHrCNRJMPr+8epPUoePqvQLiD54yxp9CF45b1k3l8dk/vrS
         DiTw+AgpL1/NKSw1reWDoKq9Bjbo/tG4ffHVAyt9QtKqpth93VwqOyCM2+YUixMtOM5k
         tvaoVBv5ysSFAux2G6OHXBUKGA1qguECz++e5IsPBE43Bwc0VIrL8F2W5b4Ihve2RgaK
         aosA==
X-Gm-Message-State: APuU4Z8AW3doetigSOXcTWP08X/+VbohKya2/NzbIq0AbjEX+OrvWaUi
	eh+O0Rg2+pHgFw5w9ZSzK3FEMCo2t+Fg2tQwW7YO+Q1PljUkdrbxT61tQ9dpJZOf5uDNt3UwTMV
	1VzJg4Wgw7fG+F53D9/momQwuhazEx04XOxzYEk6o0/V7VxTPyoGfWjzclVL4aoXp6xqF
X-Gm-Gg: AZFdTZdnpiqjHd+rwdGdo6KFnR9v2OtLE//P4bXVJORDPC9vmdrWEdVG3JrLID6ZzEq
	Er6aWdcC+7HSDU2CEOZG+QQPv+1FZh3OMyRBICJhl31WxyS1SNfF4iAvy83KMuLs1MDMjf2/mBL
	LU5U4uBUOOGhNDsD+c03aModK7ShPq7oFrbT0qpqyj+zaSy1pjM4A/HuuokXhw0khInbwkvoDuV
	OsQ+sFGzKeMiTF+AUI+Me7eT3fzK05UgAKHUzK5rCGWXiw5q8cPjuRfXtDPOM2OaJ1NoPPciuQ4
	sVUBYYH+So4Y8g6dHe605jyWog6LRn/tP1UE2/I+N4Yp7SpjjQv3NlGuWbUaEGVyI4Q0vU8x2hP
	tj1vhSUH0e95Qbx/SX5/5KbScVjFS8Ghrlbz/mmaM04J9cslX4bxZCsI+59OvPL9JLzB2xCVnoh
	8f478znt7rZKUSbMCXeJhfFj2GZIHhr1WrhVL9aaFSzZxGqw==
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr1597879a91.6.1794985234284;
        Tue, 17 Nov 2026 23:00:34 -0800 (PST)
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr1597843a91.6.1794985233657;
        Tue, 17 Nov 2026 23:00:33 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm2743262a91.12.2026.11.17.23.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:32 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ICE for UFS on Qualcomm Glymur
Date: Wed, 18 Nov 2026 15:00:05 +0800
Message-Id: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPZM/WoC/y3Py2rDMBCF4VcxWtegkUa3vEoJQZeZWFA7qWyXh
 pB3j5p0+S/Ox8xdrNQqreIw3EWjn7rWy9IDPgaRp7icaaylt1BSWQBw4/nrNu/ttPN6qplGRhu
 4cGbts+ijayOuvy/w89g7xZXG1OKSpz8mMieTODmvIdmgNGjJwJ4SZgOupKhsieD/qUbfez9pe
 3tvLF/muW6HwWGIWEg7iTKgxczeSKBskkIDhdFkj919UXHLU/+kr5JUJVjjdNRQVHDWFJYstXM
 cg8aYyAWSRhwfjyefc5s8HQEAAA==
X-Change-ID: 20261117-glymur_ufs_ice-f469fdfcf38c
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985229; l=1690;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=JkrUQ7vs/+xT3FOApCQ0TNe2+J3ILw4dg4vIRYpSV3Y=;
 b=eFoVvKqUdP/Y4AZC0DhvXeRgJ+VNuik8ESqOgl99WBzdw6EkBOgHwcppGevFIqb0B7xN8oJaM
 IbNexbum2SgBvbWRAbPNtBGnphKnIdghrEQjnGhZ8hKPcPra49FVEEa
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-GUID: HZM3x8vwYYLU1mNuPoVq0xsgGS2sVMoe
X-Proofpoint-ORIG-GUID: HZM3x8vwYYLU1mNuPoVq0xsgGS2sVMoe
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4d13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=knTtAJwehH_nPzmuHUMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0AitvJ76bO/a
 HgyWZNMszF4kBTq8dP24igMAmB7ksrpn036mG/cAdcBFNaicGbKdq7tXNbtYvYg6EqqKo0fl3uN
 KrbfpHiSuDsfRytokQvzcENAcZnxhTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX4O+2LcV3UEia
 LN95cOnGl7xhEw90AbTAImESiJYgSgqSVIMoRMxBpEDTSxHT/DHNx8hhWo+TiP113ArgFxQmehO
 FmWTGTON4Jm0t9xJUi4aEliZDejsAewIovwxQYKIa+fAVcJCewcKQyTkFMccpmtx87MIJodUDGM
 hgrBxmPyrEZgvTdCVmMrfQoImNeoPnhXyMnOjGibQnkD7uy/jvd70t2368jbYHCH6dedwLgklgQ
 CvkAHL5A6CCokgrv1Jvb3Hx/E/Rctiohc995BQTom3Yb2ePJ5iWunOe8AqvUTselNdBS/dJBuHh
 mlAiFQrgYGe2fQPxhzTxMtQntk1PB80XF8RjRvu8ToB5ZiRgqMRgXtjQcemPXvZ2rUesbA5/kM6
 ovJYee2Nyobp9sE+ENUA6sX/U91x7N3NBoC9biMXsZ6SdZKVOMhc5yPc/ayUgJdSTF6M3I1YiQ0
 Ghxn/1jia0aHMPQiSsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

This series enables the Inline Crypto Engine (ICE) for UFS storage
on the Qualcomm Glymur platform, including the Glymur QCB board.

The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.

Patch 1 documents the Glymur ICE compatible string. 
Patch 2 adds the ICE node with its registers, clocks and power domain,
and connects the UFS host controller to ICE through the qcom,ice phandle.

Dependencies:
Patch 2 requires the UFS nodes added by patch 1/3 ("arm64: dts: qcom: glymur: Add UFS nodes")
from the Glymur UFS support series [1]. Its patch ID is recorded as a prerequisite below.
Board-level UFS operation also requires the QCB enablement and PHY support from that series.

Validation:
- Observed ICE v4.0.3 and HWKM v2 during probe.
- Standard-key and wrapped-key tests passed
- checkpatch --strict --no-signoff: no errors, warnings or checks.
- Targeted ICE DT binding validation passed.
- Glymur QCB DTB compilation passed.

Prerequisite:
[1] https://lore.kernel.org/all/20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com/

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Glymur support
      arm64: dts: qcom: glymur: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                        | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-glymur_ufs_ice-f469fdfcf38c
prerequisite-patch-id: 7b02d96573a31d29765df0f0377fa934abe79e05

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

