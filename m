Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600944AB6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455454; cv=none; b=myjoDDQaGWyLh2851Y8tqoUGKFYVhUnyZELxThPQafJ7tQ2Rb7+Fp2qc7aHNjES2JhOezU2PvCShYRPUIy3C/0wqr5gQn8pZ98UqI1DuFoPXpIlUfrwc5rbaS3rrW6qkETjxGAKqIwNm++Yr8t9ZZcd+TWODx9X4PHvyAo1WaJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455454; c=relaxed/simple;
	bh=p2xjgmS67aR70B9SMa1nHtDjkQErJq6ajoUB49gceaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGxgknhSNe+NWzqp8i7/aX97wEFIBu2b0Zb5dBLI5ZtUI0VTA+rSPuv7COwOLAbYHvvvK9EoeYSmTVqQH6FefYw+zobD5ECsKV00REfydbebsj8gLFhjL++Hw6c/OY/niLfnwde0mO9vXYjktVE3mpRpxWohjurRrwXzBdH5ybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KygOzCr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJI4RGhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KygOzCr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJI4RGhi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXEYs767158
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=; b=KygOzCr/BtJZeUGu
	wSFu7q+4DUyfg4jUUY6eqKj8NzC6OS23mMWMVZGpnhcN/WcNMoahTpwFv1dYrtz0
	jA3PpEi0GfBtNxt5IAfj7bnLp7I6/Qog9wbXY2GdaLhPSE5Wf7JCAd/XVTn7ee0+
	jUxDoJpZt1c6cHOUd7DzdPTrDAMMVZWl9UqSZUspIWo3oeqHZCrKEZ6NXHIc5opH
	rANkdac3qePhFrEeJ6jJBxjGd0ZZH7DNMnizkXm04ouX1XZ/qSUOlWgqlcb8u/Mw
	6ju0hhPgA3bHWEz8bgHKv6bfESvWGuEJmUmx0W9mPJjyw7oleAwN7oAsZQ9BpL6B
	OZI/Sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2547890a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455433; x=1787060233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=;
        b=BJI4RGhi8tZeHte3DBfmUQXWwVw3oSFcUzbw/JKQaFBnIjPITirdzrrWgOjwgDUOrS
         /WRH/jUbEHi8JQ6KQsmEf/eufPo6zvklNKXC/oU8PLlWHyiA8q55IExxpb/4e5gWIfbP
         mL2WagbUVMvVWn+hKHDwAI9wof4piUkNyS+bAPfsCmzBTw3V6i3PFohLC2ff9Srq8byC
         GpVb6dzGWEviQblS4xRgPKmgJ7qPYZFoPAnMtntLat9fYgUfzDbQ5kbYSWFzCe8MkxE/
         TlbjHob02776ibhIPq2skz7xdns0910YHBvTEsQTlPwW54VnPeVy5remOPM2TMFD+BNy
         u49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455433; x=1787060233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=;
        b=CevWLY/aRymTDIECT+Daby+opAKgf7Qdp5DFGpAafxJCF5aycdU/br10xNdep0Qby0
         l06z7ecJjemOTO4d1UHOl+nyMASjdnm415RB4DjABTT6FJlamU0v8sM7ctkEldIrTl4y
         55qDAWyA5KdL9gsZfGYmLwnyGxcee/VUAQbPdm3HrZ5eUu5ZUibtD1qWd1G9lQnp5H26
         n31Fp9OlefgChhLvZUUKEa8fGhn5V5Z/fzVHr9QO0lU+MBF7Q8ChOk+/Hq00lVATivRm
         uLNRFFw+heSomJgmHntZUIe1FZ0nGsXmaZv6K4m60vW8T+jUC8NxqMpsHRALjCXtYl//
         pphQ==
X-Gm-Message-State: AOJu0YxNFncK/6rZ6TQuoczGuSMALC9NNXvAi36wM3vwNv6MVr68c3fG
	T5kptfs6rqJfrF5dpTukXaOp8Smb/qa7+gdWAvLMhacu6QzeloXA0ELDYKhdRqegBX6M8M7rPfU
	oiBXc/jax9q9ySFEt5xgzMoNk1JXGwYfuPcPuEaagYfhVYaL/Ibo3L0qxvGCne8h6CM0jgv4OTc
	9j
X-Gm-Gg: AR+sD11Tqmrk46J3PUO1sEWJdK5U1Q3tFIIZSVuRaE5y5JJUcEx+kSpyc2R9i0lpamD
	w2oyK2ha9U/AQ52ZoIMMpLwzVWkCQJ5nUhjVLEM1gU/S77jjhB+0b8fBEqBIVR3mSZ/UVrD2C+N
	E4ja9fDBwMAdmruEu5pxOqSkglvwUTWfHB7ctvGaAenssaAPAa48g1Ir00ZHcylE4YndTTptl6C
	lC20rktr0OqFLMXvbC33dzCif3p0arjvzSbEHZI+113Uf2DqIpzg757HDw9u31cwAp8T7OvwTMo
	R0nzzzsN2DwHT5wWTcdqCQq9PAXB+sUlT99nCmsSpwsJU0eAtanFHf10lgRwNYrEuDLh0YHuAv6
	M/KMEywC7/bLY06a4Ke4nlnWyBbW6bd9zwyPCsCpL1b2Y75xn928y60xU
X-Received: by 2002:a17:903:1a90:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d31792ccf2mr43115665ad.18.1786455433210;
        Tue, 11 Aug 2026 06:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a90:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d31792ccf2mr43114925ad.18.1786455432749;
        Tue, 11 Aug 2026 06:37:12 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:12 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:38 +0800
Subject: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455325; l=1009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=p2xjgmS67aR70B9SMa1nHtDjkQErJq6ajoUB49gceaw=;
 b=RbpW8XOlEMkCJtmVCURN6evSB7XOf+fGyu9WxRbuW2WabuhISd5aQCYdTcyYhgx04KovWyOF2
 hjTScrHcKQHCxWZjooCfOcNcPKW3FbWym9PgHmj+SSH96eJqNobrgJm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9MuI9CDUnkir
 sd37BiVyX0nCfrcgDEHRrocnpk0ZhDxgkKs40/NBiTmkj2rf/rNwLger0Gt4G/Oklv/AEC9f4Bg
 OrMW9ORAGB3E2ME/5Qa/xa+Zw7RnXKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXxWjyPJz0clxo
 MWHJr8jEXyNbhofWuxqm/uz6g/2JluxHWJXgyl8JhPd5oNL1fKwiCpDjnZMlPNY/jBuUsHJiCZF
 pfyWKYFDypJF0N7WDrNgG21M+KuvUPf/uB1m6uypZvFoOHEnONB1sYzTWE/oPvlwbqVQgr3EW03
 pEkm1jtZ0+EsmumEz3H9NQOgUKGp0JjCzHYKDXDGs2AM3KtzzHsLyq68LTjxbWjZ6Sgi0OuH19t
 nwjAd07WTFW8rTcUozkCpRRh7Gj9NFX/DUufq32hNhxeWPLwNWCQKNi3vpgemvo3BYDRlAIM2lb
 k8cLSWhIC012wKW4WTYkjRDl64sFnPpcKHU+cVEqltVM7PBbRtyr+9PMnylmfnM7XstltT1gB4Z
 jN2CZU9+j8XtVlgoGayWecEiw/GNquvypwvvfjiRC9rChR+qV7xMYxxB7dMFks8iAJoHGEjXTr9
 534W8tWfJ+n7+XmROQg==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b258a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3CEkA7f0bXxS4P8v5VkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SioZ_Qa1Cp_h1-QdDKjJL0vOatuqA38q
X-Proofpoint-GUID: SioZ_Qa1Cp_h1-QdDKjJL0vOatuqA38q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

struct resource uses an inclusive end address, so the correct size is
end - start + 1. The previous calculation of end - start was off by one,
resulting in a mapped window one byte smaller than the actual resource.
Use resource_size() which correctly computes end - start + 1.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1e082fb60e30..5d1854d97371 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1

