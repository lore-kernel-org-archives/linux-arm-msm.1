Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670231;
	b=4uregfOZOgCCI9Ggd+SHyRykOi/fctDouFpC7whi/gftr5adKmG8xYlYq+p+iZ1Ud1y4
	 E4dlnseZSVwhMv216krwMHnBVR4SBKMMoWMELrua57Cte5M0yNXsQKF7HesDgX8eAyfNy
	 uju9zXjEG5rbt+KorfjVSe2ZuQbI2hm2msVvlMCLxfB7gntM/4jaaqMUH1wg8OLon2Qsg
	 HbdAGint48KLozTD/ueS4bTfy3cufQT6/AV0DT7AxHuCSR6Ob6Q8zd23TRtmycf9FKcVh
	 jLy3pDmMBai4Du2pdn6mCB0k94VHGVU5QV4FbXTgiqlzdFSRwQTyK1LXu97UMDSx9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
	b=rmtZbIBzgVliHRoVyJH5FLe1BjeujK+hvh2HtvaLd2ma9fVjvuBptmIJIhizXMhDjvM5
	 ZCahIS+Ub4Ey+8aKlprlV6OIXHwlwtIgzIBgwsGyJp2iiuRCCgWq0AQF9g9gUwdyxs0+T
	 qxnrKeLk6x6nXxiZ2CpW54ZC7dqjh4DtKTm0uNkl6+4qt2qZREABdDkNCpi2RrUlxRjtZ
	 WC6gAWKbdPzFUvz1JQernLfksiyChml7/8I30oX+pKGVUn2YxQ72vGkvQRSkHMj8FWO4/
	 l7vJ3BnbdlwYpi8fogDH4lw9uszJi6eiM7PjvS5H7skcm5wU7nguqxtvYSb7l9AN3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InjFgFMT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZIQfItB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1A606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D1A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InjFgFMT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZIQfItB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MbY3995710
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mOwAwzFd2WVduFaSrJgF6l
	k2uZ7C8rbJnvsg/D136XI=; b=InjFgFMTaaO9CUH8H71Cq38uJeqHymsn4drf7Q
	GiglKBA5vRQEjiuNPs3VEzjYv2Gd994OBV4AhdXLu+5lqrUnpIlvrfbqduplIKzT
	tJK/t3yqzs8ImswSDAJYYLFi4oP4uCy3kltKe7iHwvxQNuZ0oE+0Ig4AeaYoA2RQ
	g3lcPy7PRzNksJpX7JukGmcg6pr5xMQepRC6djIWdie7v4FCEtVdTq6G5qYZzUei
	92WnGCOPgE3cEb3fAGa/a4+kAo3DpuztYpy1Ev4lIUV0HEBFCGPloC2jDKs8FhOJ
	r6+DGO/ssc0NTdqwAluKsXNBYYAb68HDpclNZM4u+GvL5zJw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caxp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:57:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2041342c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670229; x=1793275029; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
        b=JZIQfItB7RSyBHJmvIXvK8mmA8G76daI9Kdj99v+HaiMLSJKR/kZV9GNYrIWhZ6AHB
         ziF4RV+UfbZg/jg0g99ROKq2JrWsj+5IQWG9R4KXTXpR/n5sdknPkfbuVUOjAhbr6Txe
         8xpgjG6LB8kgUt91f4rNoVj/iO6B0sjYsbna4+IPgIiLbxVbwNV2xbN2u76PsUy670V3
         VO4lNuV1u7OsaSEL+xXdFcwApKgBxT2R++5A3/emmx9PnRRYbK/WRtfoXC5RjzdTAPse
         OEyHqPy7c9PuxyIr9EvjOWwL8joO07isU5/miDXC44/2Kbl2FCs5/NAP8p0gfed3nNka
         7Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670229; x=1793275029;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
        b=wE/saqzVsm4CIKRLZDU04vsN8jybKGnRvwcX1WIf/pgsHo89kH7+Pq12yy/bN+ICGr
         3P4raszrJorKQWVDjO9OnshlItt1IW6LyaoMKBM3lhG/p4FaU/s9a8H8/RXOSOdGo6br
         Ax8zSRYZ/83cDVupMpDQsf3blSkgoMr2Vpw8bOajuxmHbpM0RDi5VApdvyq9XQB9+Enu
         WtF1UgEYXs/Exela1HcCL3NvAFfBKO3hXpNa9lOf/hThYgkENU5Zx42HHMzmuwPKz6sH
         hxWGSkHUj0EHwBpXFsoDGm0LkQzr4EkO+kfrUjAQoVG1AtNrNWoHaLnMRVhHeHS4WoZu
         HNpg==
X-Gm-Message-State: AFq9FYKENJeMZouMRbklcMYROe/ScUCpUWpc1YTBefxA3OA0Nb4CXHm3
	nh98JgVvTHJ9j7Dc/pSyUy7KNUUGgIi51AOTwTXC0YStK3JiHBl68vewHAzeab+qKHK8jYndtLe
	/5hxPIwHbK107P+wJ/ikJcWb4tML4h/wwJ51GhcgDvsrd5cM+PO0PXjmTuEaJtxuTMk3m
X-Gm-Gg: AYBFou2ZssFk0NwOPbC7g0pmjL2S+Z0PKjWxQPUqucxmJeGXLQEOZybAwI4Vamv9KE+
	23sAjTzK/TclVwHuyxt4NwiWP8QDLepvkZezOVAkjuc9pCJ/jz+JYTQ87lDgaWusU7gA61zPJrn
	drG59VVVDfsUNr8CjUa95IQLzax/E4vZTgSGGQ7B1ToOiTvDhZ/CyAqu729TiI/Qo6TDHWmVrQb
	6f4Qd9aqD+D7uFVDFrnJyw0n10eMTJbRvREyKUTQwyFI7eZJ9pMQ5egTQ46Ln8ArwrUN1+c1+PY
	nkZwoncYO2JCtzlp+04N4gl8X1mW7I/K6o92VhUY4zwQDxKZPnhyfYVa19cGS5HwbrBkMUfDnIJ
	nHsVeOvquTWSfqXFE5Uetyy07cjIB/l4oyfw=
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr8961727c88.13.1792670228667;
        Thu, 22 Oct 2026 04:57:08 -0700 (PDT)
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr8961638c88.13.1792670227588;
        Thu, 22 Oct 2026 04:57:07 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:06 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Thu, 22 Oct 2026 17:27:00 +0530
Message-Id: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAz62WoC/23NTQrCMBAF4KuUrE3Jj4nVlSB4ALfios1MNWCbm
 tSglN7dEFxIcTPw5jHfTCSgtxjIrpiIx2iDdX0KclUQc6v7K1ILKRPBhOaMK9o7DzQ4YwYKI20
 aI0BUlVGakXQzeGztK3tncjoeyCUtbzaMzr/zj8hz9eX0goucMorIZY2tUlA1exdC+XjWd+O6r
 kwjg1H8ItUSEQlZw4ZLkFzjFv4g8zx/AO7Brvr7AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXwvPobB4Y4YTe
 QDylJuIdyNXT0h1sGopQ/ZZy0cv6aXv29l8wL8zwRC6oLgWimhNkz3ELK2+unmyLtPDJ0Ca7Vh5
 EjZ5ExfP2g1fJAD8dkrqdYDlXY1mVwY=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9fa15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fqOI0YBPAjHUksOb1HwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: QULZgSy8JJu5CAoSiRSkm_taeekfHBYc
X-Proofpoint-ORIG-GUID: QULZgSy8JJu5CAoSiRSkm_taeekfHBYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXxQsN1XmAqCKo
 kebE4i2BF+oDJqdpdBSr5WmwDX7BRTJEheqySoDtQrdS4pCrzeDdt7JuOGe2j/Jza1SQ21vWkA6
 dawUh8V4NcfsV9S61BNQPxnRfzzzVHO/s7r/M/aY4vOqTKv7Zebkck9D/X+MWwArOsq0RyNE8oN
 FU1UMCMs4O/gBGOBiXG3pkk82LO9I4w5XL6qKkWHHnwv9bogoUTDahXlQ50uBI8/nJkvCj5Bedc
 0NnvKTwX43u2XUhkSDnrhxmshc6Kps515WpJ8pAQf7A/DsrenhVVfxAeI5AnVs9kcwiiSHf99XI
 1SxKhJxlQH9d8Yiv7aGB1zKFgH+Okd3lYeZpz35KEQ+zHWZFvEgYbvHvyenYvFgShDukzhcSvzL
 kz44vSEizmjmTHFUSurC/xYZjlIZzN/4PRcGeWzKY3IBI7ZmFIttK6aM/hX5ONnbfJpPK7AFa+C
 8/hvka5SR4Dqgl0hbQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

This series adds device tree support for SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v3:
- Rearranged remoteproc_soccp node in nord-rrd.dts alphabetically after remoteproc_cdsp3 node. (Shawn)
- Replaced nord-soccp-pas compatible from nord.dtsi to nord-embedded.dtsi to resolve binding check issues in nord-ride.dtb.(Shawn)
- Link to v2: https://lore.kernel.org/r/20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com

Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 10 +++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 56 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 2c56e56f4d1a6bf41a09412436fdb305e8c46955
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

