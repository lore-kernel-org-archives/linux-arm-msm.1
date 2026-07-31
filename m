Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2793BAD81
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484858; cv=none; b=iuRgs7g8nDv+DwmQ95xKw2xat0c9cWtkO4SXPIcJjCyWBPlOSN+BJPZPw3WCgYv1XJpQOtsP6cdahVRHW3Qml1alToVvbYv97z4oVLhSUP60DftDXj4s4w43ID+mt19ZakTNiSao567i/mtYyRoxL+8f6qhdD8aqdQXZQkl8wtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484858; c=relaxed/simple;
	bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mm0LTpm5w3jwXp24yi9gjlwoE+2jSMpAhcdOpgjhgk5vUMkAUqWcqiAQgXyjGFfmpZYG7JpVvCpYKDbQvOIIdiXbIMB59U+Ap5QTUQsgy9l7PYAlvpYRdYyvsPwBVjGMCeBKPIRl+pZ9v40PWFjmV+YYX3zzTLc0GmQtywxTJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbSajw4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZimvV36s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbSajw4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZimvV36s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7xEg23694676
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=; b=cbSajw4g9Dx/eUoG
	mvQ7oKAl+LDPbsAILCu4+OzqA2qHGJ1Svk68fZjf01aWEaLbC7LLU/VvACsG9Ags
	CsZvvLAsfWYErAswItX9SIT3FV4KzONtdevKQ4cg3ugKZXjlFwFzURn7hIXO5WdI
	EYwFKGxputPwr9XglJjWs5xINJ1IstbJwMMckSILNH9xu1733L9LyKz1MQblnOZT
	Hu+UVnAhcHtHFBJxgdVSrFIqXTbxu8y/wv0lGW4lNHdpZSCxMzESWG1MFXTHhnYz
	gdt33rMq8H1x1vD8oaJ57JhpJGntP6REQAqmYsiST8cfT1h1ueBQXUCBsd8AGs4X
	8WKavw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqssr081-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso6384121cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484855; x=1786089655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=ZimvV36sJ+uuw85V0ZNymsyM5nxiz5/WMHy1So1eZAqcfxLKWPMtIg4WZIRwIqU8V/
         jTt3ulzt4vB0bgwJTX8p3+FSpfcurZFdqezKDS3qaObfdrnRwucr0HfKrm9WDODnbEPw
         LGr5LbD4xnF+9zeo3MDA9nA88AXKzoS1tDzSUnVZKx7zmDMjqfcyDiAEPLDMRl3eOycv
         UI0XK6lAnogWXnmTzV9r4JkLyay91gosw+YDDi+xweKYpoKP2qvMSdGTWKslXpzpy1Cm
         vfn7ZdOcUaxXw2gLw4roQ3D6+JA6nk9Fz2Fh9a8UhsIvzpIWDNmgIxiQJ1Uy/lAlKu7p
         S/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484855; x=1786089655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=fyLEpTe9knCykNqMk89TFl0++pcjjyJxYeTv5eSvsVeX6bWfbcl2rLRXW2PdOy50Du
         Y/nYYxyjjRPyV8iyoMFsZAiUUngvPGQ6kbGDGRznzKEVLpij9Eu8qgurQC5w8xXSGKuJ
         TVyHKprWCNO3XvEvoIjOA70VDXo4LXfIVLtrkuUEpHCZdinR2CcGbq6/wWiPxMiAeel8
         owUFtNBHThtcMpoJisnOVFGVF9IHDFoQEELZ62WYdg28qJCHn4fUAAVbT0pIuZKGc1wt
         jWZkn8/NnPFb2SAoNhO9PV55LK7wYLHh/+6CiANLddplOUKtoe93K9GLm572/FUCUHaD
         6mGw==
X-Gm-Message-State: AOJu0YxL7PAtiMTgWpF9UzC2KSVmJheAUbUGYEG6bt4BrZy0nc8bNPJW
	FFPoKyax3JX2sPmedCS+PdrYJzhHh2yr6nl5hb3qw//FxWTItrTwPgs6zProGmbqCOAJRm1Ail+
	HjtkIjUi9FxXERvR7juxNruDNhncCBOVYiKU64OmE82htMLp5yj+I6yBbzvNYqa4dtHlO
X-Gm-Gg: AR+sD13hQAIaSzqSpnKP8m1EvdATl0RYlceToAaTDCU2FTPf1N+rhmVYLNSfCRsMBml
	kePS+drNWdzNAM/PMyXhjibp5brqA0ZhgNYHZGFoaIksgPTZqTTbgeLkDx5ogUSEiFdqdgGx+Z8
	SmfzlvqHmFYf019InjS33aepSDWkopFljNLwy0GU8kc1eUHpTTPiWqMoOcenHDTxHPCg9IsTwnm
	SoI+042Yj0ccNxv3u9Abuaw2GyCt1fcbNQUsQdqMSnBZts1S8hiXTbpif+K2aIozSw2AsRvpC0d
	QLHMOHwqiFoFRbtuFmxhyKpsCahjLFPOGHW/dz+n+8Kb99QrvvGBr9rah8b4BFpL2gEc0pf1l1H
	+sPN2yRdy/oDx1YoivZO9VdtGHezmQA==
X-Received: by 2002:a05:622a:4815:b0:516:ea30:8756 with SMTP id d75a77b69052e-52b4af2930bmr12569411cf.36.1785484854662;
        Fri, 31 Jul 2026 01:00:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:516:ea30:8756 with SMTP id d75a77b69052e-52b4af2930bmr12568211cf.36.1785484854040;
        Fri, 31 Jul 2026 01:00:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm51032966b.51.2026.07.31.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:00:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:00:34 +0200
Subject: [PATCH v2 1/4] firmware: qcom: tzmem: guard against IS_ERR() in
 the cleanup handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-qcom-scm-code-shrink-v2-1-4ba76096915f@oss.qualcomm.com>
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
In-Reply-To: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFYuexYKe/avDWg8MfimsfWJG+ClDrPRsuq01
 bYRPoELoWSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxWLgAKCRAFnS7L/zaE
 w15sD/4x1Qc5ksTsJKtuekwV0UpWY0zRlFxtc5kBDQ/KgheAfzMz/Eg5Ho4IW6AABNRNJSR0/lh
 q7Xuf4bwHzqng/5Dc7TRgIqhrX6eypqiXP22YWtpGQXjwax/oU71Zw9zH36sm85Lwumr3289Q0G
 xB0JgrFTVz04r9t/YLx4Ix2FbvCFyDW1lih/n9mejB/2fyoqoc5s0hQ1VdLkUQEhL95URCPV2r0
 zmHmWQpPWO5/by/MEiCS9t9LXk40qjgYzpVRxGM6AUfsfHRDrDOZEj8UeVL1793ymShR3cdr3XD
 SKaWeMuFA1RrIb3bX9o211eogDKenvWqTiIoJEp7Y5helO+7oL8Wbei7Jy2skeYjmlCYkzLGbbC
 5YaR4PpEvZVmr6Ppy1HjTL0nROtaWz9V7Y88ZVslogPyvfM94ncZ1IE4bGac20N78ErZaKqeb5m
 EtHJHW5r8YwqPmn2gKd3Idx7KvMAQjNac4joLuZt6D73eMaWtbPeasJlmGKNeAVoRma9SEEHK0u
 1h382hj+mdh9bDo/+AiRsBdC9+OGWQcETRhtTHA+B7VmfS8ajXzy6CQL2H6DejftzpDsQkKbfrF
 C10uk/P9ATL66e/CmzpJCUK/kQi5OJowoKZxnaGP9jmoS+0AU5WAEs7x/9FQWVGP94gb2g32GNM
 2oB4VliNI7JOciA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfX2aHXvRxABIqb
 KQpryikT6lSCFvk0N8UDXc3dDkXm7kWm+R8gVRkbtHce9q/D6akf5krDdPgR+Zl8DkULuZzfmbt
 pcj1L1kClzdEKYoTtEjPH2o991XeMUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfX1sRl/pynSjts
 Ojl0gJwPiLSWIAycPo8UgEtG9XAgPauBSLyPv2pCafF8uVYttXv8t+ybR2oVRUONA2fPV0P6K+1
 tGnGJ2nIujdal3dXQmglWch9ajvfS9B2GGZhYT65sBxiM0vAA8WTbsTZq5k2zeOHVaeGuVSh08S
 +WFWg/XjUjfGBotfNWMv9TTHpksQICeBZx9pNWcdSi0SbEAHJLs1HcSrKbFx5dBCRj+7MhgSEVI
 PA+i+zNvbMvdbYq9pA60Vmx+JqSv9AXIlLRBBRHOWHd4g1oVSCiei8xRT1vHyNXvTN+2ufY6xtm
 ymQ4Cu7KLBWn1RT/d3WX7/fJOH5IwqvSOwxwtwSlb+uTTUEVwC8thTyAaMb7lYhq0U/eROVwe5l
 WHi7Wedv8PhGHiR5PcQU1GabmqA5+AZD4U4e4c4xVj4X/AnfW/4M5pwZwf85f3s2Es6jFMnyl69
 Z3Jm5bP2Z89oQNH5Xvw==
X-Proofpoint-GUID: qC4PAiVDP8HnpvySdvE5L2FI8YO494Ky
X-Authority-Analysis: v=2.4 cv=QMpYgALL c=1 sm=1 tr=0 ts=6a6c5637 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qC4PAiVDP8HnpvySdvE5L2FI8YO494Ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310056

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3

