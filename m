Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DAF3C3F68
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442096; cv=none; b=o8o3DcziddHmCaR01PIdZQuFmUnNiBPsm8fQ8kwkLrzHMu9xCG/C1omgxIa1hTganman3g6GwugSJY4zfvq0F4Bbu2Af1wGZLblF5yVBHhoyKkfRqKnnQmRjLtVrve45rMIAQhpTJEoF2kFTh4QgvrdQ0AiM05Hn+N8NxIsLi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442096; c=relaxed/simple;
	bh=GSIRP3BmhQS7xYPGeQGpseQQlGc9u4TA3Qjw1cKATeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZ7IOT5o+NLTVVVTry5UZO0z7ckmsiqt+dehcr0kXTZ9UBMpgkp0zyw8+Ed/jwq9YGWUreSxMo2TFQOkSl7dgqfPWU209N8GciYZiWED9ePwH9++O7CXRHOy15ye2+mrNiCRpWU3LHYCtK31qhCg7I3Y+RDRFtlFUfR6sSGMW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A91KisAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gno1cL+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A91KisAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gno1cL+4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984C3kQ2146850
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=; b=A91KisAzL9Ic6XEs
	T1O3BK9fJAUCSmhrtkEql5NNbRwhtWpydIAQo/6oo8FMalBBEabWIGoT3k/IQfpI
	pSzzV0gClBEHnrgxDARbRn+Ajz4SF5JJbolRiJ5TE9WJo9BhbRMer/mDMlarl8i6
	DaRyyPBQL+2ls+CrNlQFtnKQGNKIrkwNkj65wY5r4vPzbvLWLi2NNOWLhiEbzPMe
	BLp3zJg1u3X/6aQ3fJPYMG7aKSqe/oWXd6lgJu7s1uDf39238/zVwgRQhKjZxadq
	RE2RKFygOyq4OfgxFp0wDaFK9b74zHTPRYUtDk/A2+WqmaS2fGA3G5ByWfWnU82l
	CHaSDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81g4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:48:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e6188d1e51so14640465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442093; x=1792046893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=Gno1cL+49EWeX18EfnebGL/De8yiHr+1zDk5kYR31mIWVRCxC1gA3rr/UibLcfFg8z
         QVfnLpJEdcZWe1ZSoVFR/+oMr00ZZ79ZpdxYH9phOX0J3JuzuCZvgaapmD6VbNHhlE+t
         vmq09ExklWisXAwdNCLLjOYSKBttCl3qGw4WGMFwMWc4artOAEKUBg3QzTQP6Jd0xd2r
         O52Pa/Lcm/0IN5f7PuwLZdfpq3Cij1TSxaENPoaj/0iroM4BbpEmV9YJskwqHuINDBOP
         2mnCNek78YxJZsWmG3fxYcLS8+w4Gjy+c2swb6pSMR/FjJ+t4mfVdMrqvkod65+B+x9N
         KZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442093; x=1792046893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=acuQ5XU95qE0cYlOBeSSfp1/CWJ+zL8nuWozw9WjxoZkyRS1pehSCPBv9b1Pnr0lW/
         vedIkJ4aZwfpxazARjCY+JKeynBNC2jNAeACBW4z36kAgucD0k9MRJ92UTyfuNf8pFDK
         mVohnwDgEkIQkXpihj1F0oG6JdK4nmmDdB+sQmOtNa2z+0gd1gXtLWKCDJm8/bCgtrPw
         B7fFGNYKqU0sV3kR5NKFhiiMGiuu3XM97kjL0XsDPxJvgAh8cX7EomYkRh/iN9onIJNG
         JnSBvgoqqbsVm0VRPCDh6Q5D6+JuaCgA+Y5rZH8m4Uy/KztLHljAw8Zs8qagBK7uhlZ9
         UDBg==
X-Forwarded-Encrypted: i=1; AKwUvBxaolRoRhs88iACChULpsLJW7aZFwe5AgUVO+qHqeIhQtY0ZgDPAfEczoXwI97ltBXWoVW6OwXUYlaveDgL@vger.kernel.org
X-Gm-Message-State: AFq9FYInBEyLhjPW7q6P/qf4hVxmtbEPR5yFiXqAHJk3eoG6I4/LejBk
	5FKZpI6+/iCTnieOxe7zTXwamYs4oud0bjB+cmSUW1Qfnmt95VhwiOASJI4bBkSLuOsTQCDmSYj
	JK8Ocdko8YozOxPJiSHpASy8zOdVw1JtYgbSqdkdfwl1LcAC8hf8xWm5/XxzZBAufkRK+
X-Gm-Gg: AYBFou1aUH88BycaRbzmXDPkesIRojJoAbInHIHfldwFRj2ZYP6LcgdhV2vT36EEpVa
	miuYtUf00O39lTM2NXcLa+hHOowHbEXph1UWDSRPvTGmZyuJA1X3twVzoWO0k18Sb5Lbosbi2Du
	bedTMOppSYoUQg82SE4bT71ae2kx6BuAt4vqw5Z94OlBPfTmSFwW+o2HNW70em9uSDq4qW0AzxP
	wqIOtORm74w2kMBWbmC/YytdCABoW+ou3gQ1kFeamgYSnomy3sLBhDKW+/KEO6zX4W6o1UbpeYu
	4qcHmR509CblH45j1DCc1vlAqOiQBgl7FJQh5vLr7wBnPmQ+lV3lmh03sg7XVzO/WTmrZmrCRYY
	NhD0zUqwFqZCvl1QXPOmsCQ/DWvqmIJDOH1CoVGJK3PJXY8LzFGPX73M=
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689953a91.40.1791442093058;
        Wed, 07 Oct 2026 23:48:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689923a91.40.1791442092528;
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:16 +0800
Subject: [PATCH v3 7/8] arm_mpam: Support MSC accessibility derivation from
 RIS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-7-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442026; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=GSIRP3BmhQS7xYPGeQGpseQQlGc9u4TA3Qjw1cKATeU=;
 b=pSl8/bn/WvXEY9gArvtq+8Qd8w/Wt21IFdtyi1T8yoyytSv7O7alTH6LoIlk1qgFoHuKki4TF
 6YzLk24JMNMApzvcekAGDjpj5g1Acg1hbG9TYdHhAfXVOWF15GLvzRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX0DkPrN63a55J
 ibXccOawjZu80ft2E7Paop+OSe5wKTrAprw8nMpX27osgq9b4qhRfr78HbsMkKS/FRTcm3Rhi8X
 IYQuYe1Ybtp/nAHzUEglBn9dvW/pz9Th3qyrZqhRMvHew6MD1mUC8DlYTmhiXeQ8FXOf3ATFmzZ
 MH3tjH4/X0MR5r2L8efwYbG9esWFoKwpVydpKX35CpjgWWMnvCZ8Xua7vWleYptb0uGASjRF9FN
 7PKrgLoUAWWeGFl99TVBs03v+WwydYfloOFjNCudDDh02bRcZq0HY+bBJPIOMVJAiqWLKwDYUei
 DwG/ihABiQIJD2FVP10llo9cR6x+m9LKAqpEWorZJM9kIZUKMZeNqXGP37hW32A5iZ/gQDUXfed
 O0u0UTgt5xiW1wt89oby7V+VhSn+ZJ03FEQGejYUVz5QDi6fpWlG3rDs3LFon5tVfq9SLLkmiSS
 COalzKCXHwLgprAlqEQ==
X-Proofpoint-GUID: N0mLEWDPaJz7XMKdaY97o_pF0wZkTj7-
X-Proofpoint-ORIG-GUID: N0mLEWDPaJz7XMKdaY97o_pF0wZkTj7-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX7xufdSW5bMxg
 2B4oCQR/Axt43YddFBYAk/9fGNrhu/71PHafqmC0lHB4gn4vqcdO73IACdMPqdTq6kjOSUB1PWV
 Zr9x5cfUfNkg5ZKmm5K2TB/5eFKxJqA=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac73cae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

The DT accessibility derivation only handled MSCs whose parent node is
a cache or memory device. When the MSC is placed under a generic
container (e.g. directly under /soc), the parent gives no affinity hint
and there is no fallback.

Add a per-RIS fallback path for when the parent node is not a
recognised cache or memory device. For each available RIS child node,
affinity is resolved in two steps: first from an explicit 'cpus'
phandle-array on the RIS node, then from the 'arm,mpam-device' phandle.
The final accessibility mask is the union of all RIS masks; if any RIS
fails to resolve, the mask is cleared and the MSC fails to probe rather
than come up with a partial affinity.

Factor the DT-specific logic into mpam_dt_update_msc_accessibility() so
that update_msc_accessibility() dispatches cleanly between ACPI and DT
paths.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 146 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 048d32e69f55..80157b819c3d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2159,6 +2159,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
 	return 0;
 }
 
+/*
+ * Resolve a RIS to its CPU affinity from its 'cpus' phandle-array.
+ * Returns -ENODEV when 'cpus' is absent (the caller may use another source),
+ * -EINVAL when any phandle is invalid, or 0 on full success.
+ */
+static int get_cpumask_from_ris_cpus(struct device_node *ris_np,
+				     cpumask_t *affinity)
+{
+	int i, cpu_phandle_count;
+
+	cpu_phandle_count = of_count_phandle_with_args(ris_np, "cpus", NULL);
+	if (cpu_phandle_count <= 0)
+		return -ENODEV;
+
+	for (i = 0; i < cpu_phandle_count; i++) {
+		struct device_node *phandle_np __free(device_node) =
+			of_parse_phandle(ris_np, "cpus", i);
+		int cpu, matched = -1;
+
+		if (phandle_np) {
+			for_each_possible_cpu(cpu) {
+				struct device_node *cpu_node __free(device_node) =
+					of_get_cpu_node(cpu, NULL);
+
+				if (phandle_np == cpu_node) {
+					matched = cpu;
+					break;
+				}
+			}
+		}
+
+		if (matched < 0) {
+			pr_warn("MPAM: RIS %pOF cpus[%d] (%pOF) is not a possible CPU\n",
+				ris_np, i, phandle_np);
+			return -EINVAL;
+		}
+
+		cpumask_set_cpu(matched, affinity);
+	}
+
+	return 0;
+}
+
+/*
+ * Resolve a RIS to its CPU affinity from its 'arm,mpam-device' phandle.
+ * Returns -EINVAL when 'arm,mpam-device' is absent or the phandle is invalid.
+ * 0 on full success.
+ */
+static int get_cpumask_from_ris_phandle(struct device_node *ris,
+					cpumask_t *affinity)
+{
+	struct device_node *mpam_device __free(device_node) =
+		of_parse_phandle(ris, "arm,mpam-device", 0);
+
+	if (!mpam_device) {
+		pr_warn("MPAM: RIS %pOF has neither 'cpus' nor 'arm,mpam-device'\n",
+			ris);
+		return -EINVAL;
+	}
+
+	if (of_device_is_compatible(mpam_device, "cache"))
+		return get_cpumask_from_cache(mpam_device, affinity);
+
+	if (of_device_is_compatible(mpam_device, "memory")) {
+		cpumask_or(affinity, affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int get_cpumask_from_ris(struct device_node *ris, cpumask_t *affinity)
+{
+	int err;
+
+	err = get_cpumask_from_ris_cpus(ris, affinity);
+	if (err != -ENODEV)
+		return err;
+
+	return get_cpumask_from_ris_phandle(ris, affinity);
+}
+
+/*
+ * Returns -ENODEV when the parent is just a container (not a recognised device),
+ * so the caller falls back to the per-RIS description.
+ */
+static int get_cpumask_from_parent(struct mpam_msc *msc, cpumask_t *affinity)
+{
+	struct device_node *parent __free(device_node) =
+		of_get_parent(msc->pdev->dev.of_node);
+
+	if (parent == of_root) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	if (of_device_is_compatible(parent, "cache"))
+		return get_cpumask_from_cache(parent, affinity);
+
+	if (of_device_is_compatible(parent, "memory")) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+/*
+ * An MSC's CPU affinity is described either by its parent node or, when the
+ * parent is just a container, per-RIS inside the MSC. In the per-RIS case the
+ * accessibility is the union of the RIS affinities: every RIS must resolve, so
+ * a single failure clears the mask and stops and the MSC fails to probe rather
+ * than come up with a partial affinity.
+ */
+static void mpam_dt_update_msc_accessibility(struct mpam_msc *msc)
+{
+	cpumask_t *affinity = &msc->accessibility;
+
+	cpumask_clear(affinity);
+
+	if (get_cpumask_from_parent(msc, affinity) == -ENODEV) {
+		for_each_available_child_of_node_scoped(msc->pdev->dev.of_node, ris) {
+			if (get_cpumask_from_ris(ris, affinity)) {
+				cpumask_clear(affinity);
+				break;
+			}
+		}
+	}
+}
+
 /*
  * An MSC can control traffic from a set of CPUs, but may only be accessible
  * from a (hopefully wider) set of CPUs. The common reason for this is power
@@ -2168,8 +2298,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2185,19 +2313,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 		return;
 	}
 
-	/* Where an MSC can be accessed from depends on the path to of_node. */
-	parent = of_get_parent(msc->pdev->dev.of_node);
-	if (parent == of_root) {
-		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	} else {
-		if (of_device_is_compatible(parent, "cache"))
-			get_cpumask_from_cache(parent, &msc->accessibility);
-		else if (of_device_is_compatible(parent, "memory"))
-			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		else
-			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-	}
-	of_node_put(parent);
+	mpam_dt_update_msc_accessibility(msc);
 }
 
 /*

-- 
2.34.1

