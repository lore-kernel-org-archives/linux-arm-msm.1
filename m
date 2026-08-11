Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50842443E41
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455443; cv=none; b=LeWA99TbMpsNc736qTf5q5hG5kZsLtnZs2PD9+HSY32BGdb0TjitepdHb4XbVqKnwSlXuXpGPlqxahLj23Cgp+8pCXGrBvO/0WelSnF5dluRMGURgbYWZM8sCc7yDWdz2vKIt1U76RaHQsKF8J+A8ekfHu5o4Vuyqq3aAc13m84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455443; c=relaxed/simple;
	bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3v4zenA8A8xdsqSAH44+3GorbDQjyE9+QVGKKUTheeXBLetnv2Zqpq3jLhXni3rgS72QtHjkTj7V3VmDxR5I7H7fzP6QVjBlnqY5oUq6vJg23I/Ibw/9MgxdC7V6hVLdJSZCt35gJP5BNd2aTla6TCqJmdz9M+ELyLMXpOOu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCa8nkAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iazF/b0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCa8nkAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iazF/b0A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXEFq454957
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=; b=mCa8nkAakfH/D80b
	zyTHpDkqvojSwIXBNnhYZIZI7QdX9dVkgbNXJRUs8vHgsvVN2QROA7gl1btD3r63
	hY2bi0XwNCzLDst6zKZRfwsTkTm+ydZZyIawmQ5OVtsXiksAqQkF5Uud7kP6j28W
	1ZLCjhZ73hiAYtSQEiU9jOngRZxlxFvwaFbZ0sz4q4z2NgSZtDct4FraF+l43oQ/
	OBvorePnQaumb+geYkWDRoaCAvSEUmpH0Nzl1nohK48EnH32MtSxP9L4G9tCejG8
	WAiB2+ovwgMHO46gZ81ZXKzV6l5P0xpmeskp2ZIKOiQcq4vRITbR3u3ZnzPxXDye
	z+gMYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg5dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so43537985ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455422; x=1787060222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=iazF/b0AaNXkET+Q2lwft1VRyN16EsYehAeYIyav9+mKw3r8VD60sT7tivmvwalwBu
         XNNAXjNEY14TWGFOy/a2qompXa3mduR/FWLlomwwA8PMKBtEYxArURqWfniUOitxB1T5
         6OBmcNVJuB5uh80VwpAC4VXd9Vr8OyiLpg8NMqW4IQsFiSgdOvchU3XfOG8FECAiyWGk
         yOLnR4SiB9NRxTVv+qZHoDVR0YketOz73oKDS9B9+Nab+BqXoITH3U+iB49RDEgPh842
         yru21AdV1DY9yBIzFg59LVLptMTHAFND3cKsscNaYTHR7MWe4/UbmP43nQ0Tyxd6T3rW
         9c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455422; x=1787060222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=IqUdJef7NE+NT2jkVh+3x+PjA0ZEyqqCZqDnz0wpRpxkdj/HOzaLArvAHMqdifVwPF
         05jtZw44ZPoon0DZ1a5eDLggN4JRLd7RdOhlIkRJIPct4qDbp/ZHZxwoqdzCi0i9yFVI
         7H7n1kKViGf9W6Oq86FZvQqSsed4xM2+uRI0KN8TBoCpiv/J0DhwMaChx5aGFgEpkIsK
         WiU1vjBewshToaWBWmMtwDoCaE0y2lc4f/jK/1KYgjPiR3nk2XwRGe6zHrfHMcO9ghtE
         6zP37tGF6rjdBXBDvxaPG3lsaq7fiFnavlUuqSsGqEa/yqsr33xjnGImWPYGZFWnb7+v
         +qfQ==
X-Gm-Message-State: AOJu0YwEnfUGKrQOUlFGf9ESB/vdVesZYt2/BfEYASUzDksV2I3d/XxV
	yGSidovKh1xiIUIKDZTG6W2K7RjUnVXlSKi/Fm46A9DnBGXxgg3vcdk1BDX6bPUR2UxPKXQ8A7D
	AKM6//g6x3UE3Mozz+muheU5Foj8saB1Y/eEY+wplQ0BzSfMtM31R9q6zk3TwcYbWvvDWwh7kS0
	fj
X-Gm-Gg: AR+sD10lsoZPkTLjx0v69dhl/ix0LtZEXHl0PUojSeLCG1ozmf6tagmaMYu6SEp6CSa
	ydJWgV4qZykhRrPQP2tVDue9RgxIuhNN+zO4JB3k7kARobJsJb4v/1nQuDq+5TVVdHPaPjO1cOJ
	bK+zdfZTX8sRVxOgg8uGU0pqUr+nqMzIEL8tAMYWCpcDI0Jz7ajhBy/gWgbZCPvI3zLkA85WGH9
	pqRQnwZpSkPq0gM9EQGd1/RxTa61+eIw5YhFDxGUwoBN5vLxiiFFqIm9zHRbE+SotSQy3IcA9HL
	dvD/VGQStScKeMnR/apl/qmi4MtbVjtn1TBX5W4qF7xWGAildUljlAVJGbi8I4BIZL97EThEukS
	zmKUNOPUeCfoaVkEXjB8ROLBPITODyJoSPmZ7BrWNcBnfTplhh+i/ijRt
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43082165ad.9.1786455421563;
        Tue, 11 Aug 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43081055ad.9.1786455420948;
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:36 +0800
Subject: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455323; l=929;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
 b=s84p4P01mgVVR1o4H7MeEiKLbGr93oPLw4xXM6u0g3VS553DL2JR22LNajgYTtWXmfoJpDtj5
 xOTAS8ZQOGyD7Jsl8Seq3hYMSptmsxxLVB2XtBcIikPS2DCj/3HFOD0
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: R9hjfR9BgvnmH8TFKbtIk8s1uKzSd2pW
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b257e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tscwNbPNHAv0RIyyFlgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX4eLNMxxNkPC2
 wUJImQiaWHMNkEGY/uh8aMkS0hZHMV9VteCgHH1etxpy4FwXEgO1i9SrbSY4/btf5BcQ0FRNIXm
 Uv0dRG1IgzQ8YzKh0OUsODenUbnu0FadIr2FAxVATny7w5MueBuS+kUWFw+cuFs10EU6y7+fYux
 i8Qe8XGwLrBEflcTwknOUhyUcBmUQapsqeFO19JEfndhm6RfdNV3FXRDWi3IbWsq0QAdcJPMW4T
 QYn/RPIq6NLqDcfDXClEjlSLLlkGDkTNM7LduzFvcPQIeZ1UeYrUIqGCTh7n5AebxVV2I/lu/qD
 rFI29mpVXSm38Mv24dE9RjBT6cCBI+pzJk0E/ji66y38cI8dyPFenzLBjTlZgvdim9hg/5mHtRY
 yuQDT2GgopNIq7ocFqKXBeL90zu4I87eW9wlJ2zmhd6c5Ptsog3SZIFfR673bR4j6nHvfmGt2YG
 95UgrJ2OQJA3jsq75+Q==
X-Proofpoint-GUID: R9hjfR9BgvnmH8TFKbtIk8s1uKzSd2pW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX8s1SZQdgzXwn
 N1oVQD8QjPTNWzrJ0w0yFExX5mge8GQyIGemhVi8S1oPT74s7ZCL3yRclxdqTzZXDChMT7FUcu6
 5vxs8pz9bkcWSzNpuMvjwuw1Nnw700Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index ddc15249ec1e..cc9fa1d78925 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

