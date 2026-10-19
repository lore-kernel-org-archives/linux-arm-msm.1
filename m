Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4954A5EB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402764; cv=none; b=A0OV/TN4D56lk3/mooMYFu9euEiuiMU685ZCubp5xgvpPBvf+EhFdUT4AirOvLu6NCFMO4woJgjXvgZcGSowvVydb7rOZhdlfakPR4kbaGqtZwU6nSDQseXj2bsfl3DpF+VSOS/9pDm0k6B1GSPgEJxoK+nuQAKsHgSTpIl+tcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402764; c=relaxed/simple;
	bh=I8YGh9EA8mdehfClcMuTGb+WumIem5wJNu4LocA+N6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/+YTqWxlOwtLNcSerwOlLiuynxRWrtHZBeHzVNQ2tY7ZPvhKsATX8B1DX0KZ0TLbbvYELew9RnBVwDiZQL2bIInEZ5KQQLTNMUWwZaeedrBQojmLVdNjNQwRZlJ61Nunxkg30iwEX96yhyqByFXaymgrvKkf+L2z8VtIXninJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI6X8foJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNmWyb+8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI6X8foJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNmWyb+8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P3bF724578
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CO3dX4XR59N
	PcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=; b=MI6X8foJacqsgxr0c8hfBZac+k0
	QfIKw9uM9H5zC3HL/UvwEjJw9OguFljPHmYJKF9A4ys8/Pt26Fa/WGV40BHyUwCd
	1ikXa/VjhyBrskVuw9GWjQoHKynD/B8M0wNxcDs6Po3d+UCt0UU2R7VcDqAzyeVI
	B0Wce8EPB0dTPtxyAYNcpgj+RbQ5zPVkHxoBHOYEQ1cynzOFQbl2MgdCTirbpVbv
	baU7dYsToVebNdpw0rEGvgTEp/eMjUSTs82uYqdj1N6zc2XH1U0ehr5jVFWhgeyl
	SbgPb5zuLdgnsriI1mPsiBCazojUlSU3H0jf/H9a2om1dm7GE4PS2Woi8Mg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gdg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4ab8a6278so714490a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402762; x=1793007562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO3dX4XR59NPcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=;
        b=KNmWyb+8XTShSwjTP7oyitHrKlXIcsRc9mkhtMbtFnitbdfKMtY8sioPyPvO5gaABe
         lKH665poOhJtMTMqZUfqSZZWUdHtl7/zhJz/wM5Ovi34Xyv5MPsK1JTHul13wdxndLVb
         mB9oaZSb5zwPJqx5N4IS/2OKiOSQc53k48Sqz4NmwQMOW2UOIxJLrcPdIwRW9maRxar9
         lyebhITpr8fQn7PVWnKKXdWyP01GngWsELbAK+cuR9aOlPUDSkajM4+m1MN8WFT7arS/
         uFsOVYyfcOuJZefnbJcBf3/8ckwqA/D+UbTUSjAleG+36AhpeWEf98XhC9a6GmHyc3H9
         RxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402762; x=1793007562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CO3dX4XR59NPcnLzqS3CmOLDW6/A7dkcb3QefX/Y1d0=;
        b=1wOsDQFFx1OKY6EMu55wjiP5tXuJ2nfXKUVhqMiroI1fAXkfyjkcMHdQcDrZm4o2+O
         LzV+NY+TkWbvVU3tkK61LYOY6LdPYJ5xN8B5KpHwBPI/TtVs2nYA0OxtUoOX3Lg4AP6G
         KvElo56SSRkD4EHBxmpueqZx89Ulqe0GTdSKyKhUNAT6hLqfn5WNUmMyCQ5eZmL4nKCx
         SGEO8GOIJnBJhYRuv+hj6+SQM6QIaH1xfE+jfz+1bZyq0iyjYxZELI8srMlM5j/48rFv
         UpSkfp/Os2KHDBCV+TTy6u1pSMHKCOgZArVYjcSI3+VYsYW9CIhsIjIFb3Do5ovNCMnD
         5QEw==
X-Forwarded-Encrypted: i=1; AKwUvByjjfOPo1uQHY6FB9mQnyYpiA+AzpE2cQ/QBD1qxKdOEQJZUsxw8CRyjefnETj9szCKo8wV08M58btGTFgI@vger.kernel.org
X-Gm-Message-State: AFq9FYJy5GsMOT0DXAtlGtERLjQ66jlWYeNDfAu3oA5rFqYHCKAcSCHX
	RFjF59EGgfwJiH6xFrQei5C3vaa0hElUYEDHmcHS4WLpEKE9uIb2TaVGXQ77mS/QhULwpwbBJe2
	pqbO54DEO9nnwQBp7nOlIzCwIugA/fRkVZMtjLclKDmUBDqC5tOa46vPUXKYIlCXCKD27
X-Gm-Gg: AYBFou2g4zQt6eUAkqCWIBIMG70Vcqbye32H6N7I9u0Vu/xym4niz8uqbKJi1cKhUDm
	15XF2xtNvRuDw38dczp2PsiFon0MtwWpDf1iMC6glcsgHw7m6XHPN4fPrJcji8Bf9Dzsbqo1lXn
	AkqYtNNqWcQwjwkqf7JGpPxnVcui0GPUeMW3sZRoygAXb+nEeWaWZKNd8+GCeuk4cSv6TrPrG0n
	QiO1kckpMSsIUwbzzhSUfF3zvpN/EalaXcYWx6rpluZqKd3m5Q+ci8cO9IyEG84UhVXcybqvJ4e
	MT2VyoEGD8ixS0Nx/4YIkvD92VWxHMYNa0ZNi80nhK07N+01+Y/jjmPhyqlw0cQ0G64PZaLiuXk
	vttVK1DeRp7cZAITwLu2+WzSv59mj
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr10747898a91.4.1792402762146;
        Mon, 19 Oct 2026 02:39:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr10747882a91.4.1792402761700;
        Mon, 19 Oct 2026 02:39:21 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:21 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Mon, 19 Oct 2026 17:39:08 +0800
Message-ID: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX/85A6NuKlSQn
 4aDOX+wXXm2ARoDyJ3Od/3ZQAw9LbkZR8g/rNOKJWoulLJL9D9HJgfctVjEe/ee1cKR+D7hsw2X
 6yeKCazPk3KsyJ5nTPf4iv7c+rKvsLg=
X-Proofpoint-ORIG-GUID: rIRq1dAJT5KQlqXk6Gn_5Kvl2vYyqwr9
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5e54a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=hnRN73myjJn4I1-c90oA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXyngpMoGWpZ6Y
 +svracAqc/AVrmOcGE9BHl6pf9ppqORW//pBv4ZD88TFzUabMmGj2IUCtmHODy9Qlc7UarTswRA
 wkF8m/qBuAVJgkAsCo8daEc0rxXXES/X0fKFq5a7ZmeRq0TvUywQ8m+RT0KeGF79iUKvE3rjBJ1
 LQIvUtrPOmviLFi4RN3dSJS5s3cAT7HL4m+G9czKWWTN3pDskg7xH5a2SPSkG/KK3KHiFBuvACH
 vBMI5aBNbDs/55rt3amuHvdBCUqrkkd0Ps0dM6T6MuVhgWcSX5gjCP3jTIcn3bN6hXg6V0GXPm3
 rIp1sG7MX177/FTi8MxcWItDj42U19aT+ZyPygncPBw+PQNm/u5iXQm3XerDolQV2oj+Lgk0KBQ
 wQKnIRLwxSmVW9ChH5i+Lj/YOF+7oCMm3UUhPLaxifTgjNVvpM3EvHAP01N+puMtCaZBhFNzDkE
 Q7fFfe4MzMrhb3LvDoQ==
X-Proofpoint-GUID: rIRq1dAJT5KQlqXk6Gn_5Kvl2vYyqwr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
resources need to remain available while the application processor is
suspended.

Teach the Qualcomm WCN power-sequencing driver to use the existing
SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
as a wakeup source. The PM core keeps the IRQ disabled during normal
operation and arms it for system suspend.

The series documents wakeup-source for the WCN PMU binding and enables
it for the Shikra CQM, CQS and IQS EVKs.

The series has been runtime-tested on qcom-next and kernel 6.18.y on
Shikra hardware.

Changes in v2:
- Derive the wake IRQ from the existing SW_CTRL GPIO with gpiod_to_irq().
- Drop the separate interrupt description from the binding and DTS.
- Focus the description on the functional behavior.
- Rebase onto next-20261014.

Changes in v3:
- Use the "dt-bindings: regulator:" prefix for the binding patch.
- Drop the RFC marker.
- Replace the "must" wording in the wake behavior description.
- Report runtime validation on qcom-next and kernel 6.18.y.

Linghui Wu (3):
  dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
  power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
  arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup

 .../bindings/regulator/qcom,wcn3990-pmu.yaml  |  6 ++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  1 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c    | 36 +++++++++++++++++++
 4 files changed, 44 insertions(+)


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.43.0
