Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C332D3225
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455464; cv=none; b=Qcap5ITuuPZrmuCHUDtOQLTL+wy5VdHoBkj/IjwpqxZDQyHqz8ilg6NIinCeZe4cP6G8pMrKGr7JzNu0EU/qqqzZk4Dzhgkgah0BZca6CK0lAfHs7o9DUITMc4RFZBc99YXczk1qOa1kF3E7H6rrz2tvZ/Hdbd3rriHBwm1CASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455464; c=relaxed/simple;
	bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUsWddA1X2jkDENqdXDWRtvSVmfQnjIxOuNMXyzHZ1JFM/SpNp2z165tdKXK5b5uSnTq+XM8HZrdRaKW1IVjDF5eYg8TBpnvY6N/Ihw3kFbX4eGfPSzWc0LU0KX4PAu2sZ9U76uvoS89U9KxNKQdP+ASTDoXy152RBGc7OTR8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA1SxQL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnVB8PbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA1SxQL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnVB8PbZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWjuE1090650
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=; b=VA1SxQL1VJOPQG1n
	+1pjJUPFvJwWAPLUYS2z9S3oZdJLw/GuXjlF9NQKBVqVPns6gPc0l9QadbH0xhv4
	0AdUEEVSNCm+Q2uJRPdl8RW6YX+zC71BER4VQHJoqMlESPjVBUKcdocfb2xXa/Nb
	VcA/ocmYVMVLs2fiv2mBh7kDpuzzMXnvcKS9+DcjqRKKo/jb8agS0d1JH6sw1c7J
	lpPST/RQTNp5qvTTFYQTWWfv3CLb/7Xwd5F2N5/XzdNKj0pIc4RVgXgmAEmIvPu8
	1h8JYDjUw4rmxxcdUpI8ftH3MYJZ8iQAIZm/hz5iNSg8+oid0m75YmkuC9BV6aoR
	SjGLAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049er68d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so30921895ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455445; x=1787060245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=BnVB8PbZTAWxcXC/3mzVPq3vQ2I0I392JUrAZxOGgqmgRv1/u0MbnSRNvFhUQ0ERl9
         DQ9hvn2jvgdKfu9d1E2cutEJuGfd5MIcadrZM5rub7Y0KV+UDyWn+txXLb6+p86VhRhT
         fsTz0Phs2sK0kgZ9gJ0Irqc/YCbJ+5HZHl9NV0leR5lC3RUH6jnSuRxoUUvRDjD0aB1F
         wSXXlFynJiZvi4vfaXKY0/v0/0JkbDHac/BOzg/TnYszDnOxbxdkAAngVE/Unh0yXZk8
         ChuB+23UFH0wsTdtzxB80dhjgW8Ks0vxYs+absnL9yItGqYIETrdBnFyiW9FHHnj42nV
         lD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455445; x=1787060245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=sOBomJVfYStvjp/+7SptdgBhK4a3vtyye7dyVqIonJc6vfegh65yJH6qvhel/zcorj
         HoAvLhpkS91I9prvlkTs6TTneySMUs0vDKZAbeFtpZMFdkDNhEdFV4TdkfmDnaQoY+B+
         0PSUROwKYgYEuI1w29vC7OJkFHytyCv8YuyoKWiP+xqPCguPG4DdpG7BJng01Z803k38
         pfvNkWYmEb+HQHp5sCIk6jxtqwa3JSr1zU/YLHo1AA1SPelGObBKNVi+veyRgB2+Nnv1
         ZcRwYGgIoBIVcImSorMlErqzkzZMYYF5IXkkDTZWsp4878MKZbIYKJStEGy6ZTmQBgx1
         2M8g==
X-Gm-Message-State: AOJu0YyYN1ByQnqKB1L5feMCyom5DUCU55K4xDiGNEdNV+8zDwRluF7i
	/MosPoAH04TlsUJGbCS6oc1oyWgN5t8Uv+y6ZJ6XsOXv7wOfjVbsCPJN59wl0YEo5pRHNP1gaeO
	ZQQFYxU/JxuA4yYcB5rxGvnynwaWAIMjzDDXXdcoxu8NNLFDonXwzq16XDrvR2qjGqQOk8/nTVh
	n/
X-Gm-Gg: AR+sD10Q4LCkdQfD115o4Dmg2g+PUzjWKXkfwpcpvJSaK+4ElBVxlxv3qXfqeB7Zuzf
	0tsDnD3r/ZE6J2/rJV2zfRWvTIdpA/EGxVlIAetT2+Dtev+HULONW05MzbKxdFNei8asN7RGQAl
	A8cnZLn5XTYjsS8kt6AAdTotgj+15jH6MqUKQvvbTKIKqIrhmHI5/3L7QVF1TN6Hbv7gkPRyunG
	PoQCNaDI6b1s+CDdBl0Iw+pU1wN2gPAR1WrupCtsHH63eaHhE4eL8O2ldEZnyR0kp0edfGc/JLK
	QqQaqe/mcHjKIHpo7jiIvqLZCZksUZD4yDgZMU5mIWA8VKQ88xq2Yd4bJMzj1jbDUy9kXXkkeFF
	DbRUUwa4WWVs709XnsM7/tONjy3KY7F/1jR0yZX7vM5Na2qBb18aI5tLU
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37192875ad.12.1786455445033;
        Tue, 11 Aug 2026 06:37:25 -0700 (PDT)
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37191715ad.12.1786455444454;
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:40 +0800
Subject: [PATCH RFC 11/15] arm_mpam: Fix mpam_dt_create_foundling_msc() to
 create MSC platform devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-11-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455327; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
 b=vzTRB0AF+pFRMYnNgKH1uIlaFES33p6mQJ63KtCUkA9LHR/5oZRPDKE0Ofkrx5KGIM9a+qDlN
 SnmgFirBDTiCoGBGz1gdykNdFv19pfZ8PtUHMkd8dmJ725IbaGko1ND
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX7oDtjhXN87ae
 WK2/AIFOFBfyD5KrjR2jU3IxW3F+0DjdYEWzG/2gAvgqf1a/5KDDWoGVM13yA4rYODJ/XJXzT7M
 /ZWSNI9Nmb2d9WvhwPeL8dLL78wWcZY=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b259b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ksFOqbt-pGiEIAjTAq4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0a05OUlVVMkLabgHseHpc8VAL027uD3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX+Eaa6qOgDXRP
 rPsxqYLl6MqGTMF5Fb+7JTxJJ8rL/YZmQl/UBiiPz/haRJq6Ora3BZK9W400tnYEkTmZ47189NH
 rl2e2JLkESahU1epeCOz4wMd0XIqBVom4JYM0AHJ61kymMwKIynu69lHl1ZQIL/LV8wmMoSy9Nw
 MdmvEaFYYzNsmOcFi4KEseo+DnFXmIjwv14q/LrkaRORenj4jNAoraUC50hLyQtwQ3U08JepEiw
 hQMMn3kZ13szRclBFvmf0rHxidoTlQ6j4RLSp1sOM8Oxz2fxJ9U4LFglnGN8S0YkezwoE8nzL34
 tK9j0atyY/FCWwaDMM+9ju2IMx+I1/JTrz8MKxB+JcSH9N5WLC5/+1JuYxSvoX9Xr5KlGmrTsn/
 SldK0u1WxHD7P9Twru6qJsyCn8j75s87pA234hUwwK0P6bKQwpba0Ql42BmdIuXgXZKqf4OJQz3
 v/8fXK3OTQYN+Kazj8Q==
X-Proofpoint-GUID: 0a05OUlVVMkLabgHseHpc8VAL027uD3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b0e67c8349c7..eac3bc695fd1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2358,23 +2358,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

