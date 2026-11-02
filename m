Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614747;
	b=QPuaoAMhDRdHhwlFAOJyxRpg311x2c/euUkd/QpZUPyd/7T5jY1tvxuotEmSj4C7RmqW
	 5cdmy8sv/kQLB+LunZbD9RdJRKbDrewqbPVRHavS0oOwV2hv2oL98Oe95ayfWH9FmTT1Y
	 lF+NM5x19FHPxOe1D9fMkCfvD4sUo1D7FqBhYush71S2+RSRoMxN64bfil1tpGTMIBez/
	 lh+Lp0SkV+g6rje2FGakL0d8dTcOpP/jsHvS5Blck2HsmAmpW89LcG8DHbvurxLRh0q8K
	 4mCGFG5XziI1m2lKAYqht7lHTmZ/wdZpy6hmAsu9FVZwW/bpVFHm8KKODoWecy+znGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
	b=ZP9SGzSF0BMxcD/fOUZ6PsWp5ZOK7ttt8pVclsjtp+xlsNq7ifDKsVO8kWD6GLsVIFgE
	 rHIcPw2M1EQK/D0LjKBA4eFizy4N2QdfZDM/83bdnaQ9WM97DrKcqotVfD2F7pObhmYEb
	 VZicGjKIgRw89sMSdu+xWVB9tQUaiENj8G38Qyje2r2LQUvhN3FXypUWo6pIjBWKyTmih
	 hfNT3NTpsNT5SU+YVfBJ9qIvTbZ1rEtQLgH3ZgRIzRwHWw8yWSVxDnTzy/t0yO2E4EBwz
	 Rz8eM1yVybXJnwUMMAyCEcoSj35mrkEsW5Fs094Tbk0A176VXHpWz2kvHp0b3EFY7uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hpX/6Fyb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQ3sUz6e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7BE60A2635
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7BE60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpX/6Fyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQ3sUz6e
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A11w2466143
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=; b=hpX/6FybHZozlhoK
	vIHGkZdU52AUGWQvEb5aTqG6apalSZuaUTgGdtZmI1VuIrhw2MW9iUvI6m+Vs5JC
	EcZ2jL+6/hyt+NpkSb5XTjB2zOgVhOob587X0WF2FQMWE+8nCp+kWejeD1nM6oOI
	7NX2FEs5iDVkjcqiAc3VXCnWFRZW3f7S1XF129SnyRCSmR1DNLKmlOhX/HLlXCg4
	gwtzb1fRSk5aYXXGaCnjEaoZL8w3BLGvi6ocujszrc4Gr63OeMWEW2OMiX/9TEp0
	nVLm2Nh4fuCW5F2ql97K8tXguK/i+ItUGx4aYX/jmduMjQwheTx9GJtvAG5o7+5Y
	3row3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rha5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:19:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so547121985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614746; x=1794219546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
        b=HQ3sUz6e/ApooZDSjn1i3FCf+PN7h4xifnU26u3Xk0c0vdJaA0aCEIJJC7/WKkxQve
         dnQZyDFNsx1zEzd4dPnnYrBy6OtHVvHch8/vDeUhJTaociQdtq/lXMWbZCr1mg+Acrml
         CefO2dFeMkXzkIzmInU8ghJApQDkKlWWrsSbDPXFtxNewfkFPnZb5C6/010/m6PP5ajV
         eQxfibOM5fEJw7bYAITMxVs9qTOAKAGFo072lLcJ2auKrp10FTNVRLJ1a/rdj9SUhx1O
         K7VowEfiIvUmLGGqFutlOlYrz0RoiVVSXR3dn63dhheukuVns85Zj9vOWwo+bsygfOj9
         QQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614746; x=1794219546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhBrIJQUG1fJxGq5+DDrS6DkHC+u7DNjLFJ53wDxGc0=;
        b=cF0oGEiLI/GJDuJyPz2zVlI0N959JROTJ9cs04IAmCslo2vUKd9x7ST6gFRGjeclST
         aswYLlgEsAZV/ZYsldVW8r+WDfch8z5tQ3VI4HxPcvqVNApA4UzBvOddFfP9syGHYsZw
         FnoxqgTseUOVdUNHqXW/oKBKR98uZWIiUzV63nzCe4T5drrZTNwP2h3Rk0aOeen8G2Td
         ZaBfD+CssX5+nCYHSiZmomRPgV4IKhTgVrVXamdyI+yeIyAvEY04yud4Ih7MBoCo+Ant
         CmN/RGoNCK1ZClKl+LIxAs2WIW7UFfhXybeSUp7I1eee/xUlZtoCWnqJxgPkd/s2Ek1a
         Sxow==
X-Gm-Message-State: AFq9FYJ+6qaocv2U2b3O+LL6ZvvNAk0B+uhHmyLUnXjY/Ncn09mIb5Nh
	HGvdDx058bdHn4OBA7tZJ+jYa9KBMaNT9nlIJj5RLa/NrbwSn7F0WheyiZkg11vCSTv0VDaKYH4
	QTMBqXv4e2XTkGhxWgn6nyxFELSqFa7HzkExqt+lckHqv3pxgV8bQozpYtIxyEWTaHJsp
X-Gm-Gg: AYBFou1wVqSHJF9T/6fkn6ZsClNoIcK14EtzXvya526xk4LLK+Lxd9275bQ7VOnReji
	8+Ln59BjnCLgP/g3mRR94hIWnknYSB4kY8FgU/IEbiMEnK2mqI1nflE7SVzy5TGQfb+vD3PQN1D
	RF/mIkpg/p+UoIVkyCA37yy73GqPudBO5pHbNVs9Dtu/dQu8As8nLDven7mUF7SmxM2GSPcwPY1
	pKyIDfM7ywf1u7Nq5G4F/pESviZ43gq4zQ/TYutRWyYM9C1bWABgywYKyl1vNOAODNVvHY1QbDf
	cvPLgFT7B+SSVs6eR0hRNGh0Y9eSxUk9GZSKp/L57ddjOTCpsQGf3RC0miwFHWUTgIx3Uv5d8X/
	Jrcm/CSuhzjUOLUij8wQaZgTJaKqXLSe8UTe1K/asPFdzk1IT9D4ktkOgo6rkP0E1MTVi/LZd0J
	2+kg==
X-Received: by 2002:a05:620a:258f:b0:939:6dfa:48fd with SMTP id af79cd13be357-944217a105amr1467226785a.51.1793614745676;
        Mon, 02 Nov 2026 02:19:05 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:939:6dfa:48fd with SMTP id af79cd13be357-944217a105amr1467223685a.51.1793614745135;
        Mon, 02 Nov 2026 02:19:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:54 +0100
Subject: [PATCH v4 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-3-21fdbe876883@oss.qualcomm.com>
References: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
In-Reply-To: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6WA0szn+2IsjDbrOHuMstXQe3C5UXanuAMkyULI/g4I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GOR3DEkF1UWGSNforUC3f1jw8q+ZpK4iiJ6z
 GQ9yuAr3cGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 wwavD/0Y4BSUmnw9IExYdq8myLYGYUEXtYW22bAOaIZji8n7j2S7DOUDTskIXzRWz5MmMTmB2ip
 X0g6izxZ63qcNCmEy4uAuGNomSENI3MUGQkv6K59xtMJg1UEk7oOWtpR4aQM7L2xJ8ll04YuA1t
 ldyMAR83mXFXLYe75PQT/c8axisQFDQOZN8Id9kzcSbmYZnNmYEq+LTMSRfhTcplUQhxmVIX3jV
 HgqLtRRRUy3zMfVSdvlx1eUMzjsl/FukD2NWTCIcBf/DxxMrvhOKtA1q8vkmGRSHdcS9vs7ZU4Y
 CnqDGgCC+hcLg7ixFdLu4iEQOsa823+hpqGgfrNpaGQkvpsiD5cennPVl03fi2aZWEas+C0E0pe
 KHEMCgI84GRugGdjCG40xV8mTB5io378hgPkVIZMu3/Q7p9rakB4FRXtW/oa9PpxWxoO8u6Szq0
 BNKU/K7A9sp3bls+q/K5Pio9s+XzFtbfZMaQrFjputOwH6zJ4wlwTqRB5qAXWuirzyOuhO6QSGt
 YxwSb66njHNQNkXo1R4tuuV3f4XVzveP0JKxT4e4XsX9kbKHTpRI0CMEPAZ2HMlyMNTFJg6GeQA
 iZ9fxUZzfAoQf122AJkdiuyE6LXawEPp0p4dKML1q/jKMAkLrnv2UZdZpzzXU1HdHf0XXJBOnLS
 Lk75xbUgTe05L8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: CkVnFHxn7Ee6n0F4V4Zei2oHyI3qNbNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX9vOrYFQgUMZm
 ZO3P69Bxor5sH9wPUf2C5rAdx5UxH4EKSnNdbTaaDJIXA4J+xGKMAEt4sN5p8M6ZK37k+6xoll0
 P3hQ0W58NzZV6iUNBg5h7cfvlbqxT3Yi8yoZryoN8S61MXJ979MHVYQ5kdWnMWRXd1XhiOZOCS/
 i6ftCepX7kilA53ty5Fz6m5Ba6RyIL3nx0Kwmp0M6ZLC3BhNts6PPNcrYmxykDqR2oV/MB3Pdh6
 /TvTsF+Op2JyMJmtpxi5y0oeVhc0/Md/0US0Xybn6mylH1G9D9x5pdOKnQBW9W/BPvuus4l23Wn
 zn3LGQvSs0uebSOwxHXoC8stW8mh/mIGe+XSViV5NpfLrTxuXtduXs/neIVfAMqBewEjQ9Wzts/
 62TRsFk9WzTOep6UN7ecLD//tUh4M5xro81AF+LSEuaVVSGMA49Odjcpkv5iO0ZzCuww1jxwJ79
 Vaz0jf30+IgGMhuUh9w==
X-Proofpoint-GUID: CkVnFHxn7Ee6n0F4V4Zei2oHyI3qNbNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX3uqbqNoRZR9Y
 vGUNqny40KhLwyr0j5wwWUSLe6T9GOKVCh4yAUfis9vvd0rxr9SmLZyEXfT5X8GrNeIbiku9PQx
 afnUZHJkxgTyH8WTWnb2mJrFt/jMIMM=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8639a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t9k0K3iV4HLebYkdnPwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2fad9607fb0d55c33893785ec0db602c4f9e6bdf..28fb80a8496fe9a613228d4fe3acab9de2637634 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk_guard, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -589,22 +590,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -699,20 +697,17 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -777,13 +772,13 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return ERR_PTR(clk_guard);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -840,9 +835,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
@@ -858,20 +850,17 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -934,20 +923,17 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -1705,18 +1691,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk_guard, clk_guard)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk_guard)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1754,15 +1735,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk_guard, clk_guard)();
+	if (clk_guard)
+		return clk_guard;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3

