Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09B30E851
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637985; cv=none; b=cXIDLT+QHczqffZ5pREOuwduywe8qQB3o1kjReJ2jF12pfmwOrkV/2RmBhL6C3LwMxzlWwGVvsWbFng0S3+lXWlsh4rTADS9uSVCRlkZlDhneFBmM2cXmTneEnz0nZZOMwgoeJnC3wcZWRcQ/BJU2fYekoqWAA2zThV8/lkfyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637985; c=relaxed/simple;
	bh=o7FBTKIJJyfscOK4BGpJqsmGkVsLI6G5gCzTwUk/ink=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvwRqk6xiFX/GVTLGhJahKbhkgj9VORvdp9op/9i/CUc9Gl7/UiW8hpsjM9WUzV0HaQIMiMtJNofikiM3366T2kZwk1z1Kq+h6kk0XVQQSw+j+hn2q4llfZ35BVI86PqwkIdiUWhlJC7v6yLDV2LSFXhDtr7OtYkxlorSv1bnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8gOuF0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKkU6ooq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8gOuF0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKkU6ooq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAROiG1499997
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=; b=b8gOuF0fFojc7HUA
	forz+g6v7shG3dklfgSwOV3U8Tb/YpnHokjqXhON2HzbLetwungByF1CRYwnLMN/
	IZX/tcxHunAFUuObxSO8xzq9erFpMUGxufWIgcH1Nj0wVqxkAeJ61yVFzT2uo4Hf
	9pqbvqf6OPo5ixZ2g5kmtRfH0uSy3bzPVxP2XZpsK5TlE7BXyrsLgRezNPNL2YzI
	eR0rdOFXRX3+VLhfZ1ucrE0mFcQZ1ZpDopgn1NXba3leD8hpEQ5Oz+/wkDgC9Laf
	u1BzRqBupCAk3vDvVZE+Y+C57/OOXK1yWeca0qh+Y+A4noRN1nLclJKnkq+hiImt
	ni1gDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtced-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso7260084a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637983; x=1785242783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=;
        b=WKkU6ooq8JEG6rpiEbpPE2o1uuDayQiMoerefXNBc5F3uSryTWKH5fIynJ0zYmzLN3
         XBj9IH6/GTjjKMji64Icrcohgisin1I0PqKFtwwgteRpEt6ksJEeQrBXDdqjGObd3jen
         uVRmo3L9AJmNQKT834e2oytO4hrE/aJk97YZuncHO75ktvVPi/v6lFjDV+ozA9lU3K7g
         HShaVF+XifHAC2DVfpdhFLWwmly6nCp2JbGUl6dDVKD7nlL4DOUBCv9Msk9OL0VFBPwI
         nX60u/01VatTXCwuMWQxnsERb2jyV/RIJdJWewGZ9z3O9BSTjzPshPyy6ZRQtjniw/7I
         NhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637983; x=1785242783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue2ael/NgWihxiKza333EZtUQUQbwo1TWMqZTaN4+3c=;
        b=n/52iXyBhPVSMvqJE3lNj55xS+QUck5OGA2ts+IuNJfpEGzVZzfLcrgMsf9ecF6EhY
         wk6/y6SdPhGXrHeddcWY2oFzRRScvrJuOhsFbT7vG41scj+qxKpXIb1DNKXuEvoN4aO2
         c99FIRtaerz1VOUdgkVMWrgUNWgvtYYy6awVIacFRHSmPtbgB/nf07T13mYfEvsZMmy7
         IOjw11RbFFZj3rz5X/u1EswT84SbYHwa1MqJNm15lSWbdcuXsLId1ejxMHyiF+OBDkxr
         3R915+YJubCQeIqxo2fhE13qODulYqe6ohepI3bFpjB/aWUgCDXE3cZ7QUJ6TmMRdB6L
         0oxA==
X-Forwarded-Encrypted: i=1; AHgh+Ro95NXelvZoAfbiBmtCrPsUdFUz9rU278Dh0lolhfyvHTRqdJMt4CVjSqVy0TcaCKtRFASUmhbI1vJWQLGI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+r1X7kAti3U47PZCou5j4+wSVCK0+1wxd2JcexPgDD6TNpWU
	nTXkKDEnlr+TN8uQjoXLzOGizvbYqqJNlWaXhNBtEnIY2M34vwe2h6UGxJv2qRmX4Im4TCSpk+q
	scRquBPGFUz318rWgJLo+cJXaAE/stPRqV1qc7j+dsQK1CKbKWEqlpqJtdItviBvLx94z
X-Gm-Gg: AfdE7clndbrwq0mRJ/NG0xq5Kaq4GStHzE5ppQ7tqoyEB9GB2sd06sMrZ3goX1P8Fcq
	yZCg92ITHebEBD9yz26ua8tRIjPU2Ap+qZc3pmqOLTvYbPNw8OsqfdmYDjstgym8oPD0ZpI+X2p
	HPuH9ewY+BDne2xjLAIj3AZwwpjZc/vu6y2o7PbTzzSItBIOjjf29K8nHxnUzt/8wgv+xUe8PyR
	cC0uW/scN5X49YhhmIGL2oDk6Ht73NMiQHkDH/Ndba7F7WUaLgHal5iEAWrOLTp8yRN4dE6m7TB
	Gkm8I4LjoXlrwEKF1eVtrhf/DNaswW2/NUR3X12z6w6cF3usNuwCN4AnI0Av6GBzOy/3l/ieaZh
	CIJQvE0B8Pd2aVxPAySqmAQ21REqIeDCW5i3GsT1xRMV0TkyjM38L+ww=
X-Received: by 2002:a05:6a21:1404:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c3ad963e99mr17621869637.41.1784637982456;
        Tue, 21 Jul 2026 05:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:1404:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c3ad963e99mr17621824637.41.1784637981892;
        Tue, 21 Jul 2026 05:46:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:03 -0700
Subject: [PATCH v6 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-4-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: cqF4pox3---rP3-nMwsdHhRKMsSwtlzr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX5cS498fYJXat
 djcsxUxK2bfhpII12eilIYAZSvFA1K+u4UZ3en5dIXVWjyKvaeW5Kzx7L4mSUgUOTfUFxHkWVdF
 WvL0W12u73tGsPsTrYEJxymS49fxG2E=
X-Proofpoint-GUID: cqF4pox3---rP3-nMwsdHhRKMsSwtlzr
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f6a1f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFxwwg5cOWCKIq9qzTkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX8m2KwjKDe6Yg
 endrIWaTvrdm+dLhRULzDGGmFrrzoIJ1bGoEpMreWiWelxg79V2darg7A8VnA2TJFtCQkXrOs4R
 cy0hnSkO5Cs8+K2IXYEa3/egC7x9+ej9q7nEF/Z4lYthzdKATNlf32XJWQmjT8lwy/Fqj4skMKc
 IsuG6hy2zAwdUjc1fB+E2mKXqJRBhxWTuCswyqVjS0VZ0a4KqbgMOLNiQ3V0MRi1DHUN2hvXwof
 Ll0gp9FpxbOP/wmiavkqMC/Bx3yFgMOJ+JduZK38fHm9UqAm9RCylV/NF1YcM9pcP7biCXl0IWo
 qKYQQ6jnjZ9jdkndvov7wp3ibRRCW8v81vDa1/D88AK1+7BKPFemxVuWmR/GNUQwB2m8buJUo5w
 Xt4owAhbmcqDr8mu9c3d2DWpLwqTOZPsng+YYyxfCYq382cJlDhE2JpLg90L+CZBxkLzb3fNOUx
 6W4f5PDwb+HT6hHOi5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9982174ed1ad..1ab1a0cd82d2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6085,7 +6085,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

