Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769354;
	b=GLnh2fVNHyRgZIJSOr/GjcI1QkeZo/bnjS92RqbLuIGul5s/z05VvLe8XtvpjpF13AbM
	 cLWjiw9mFjyYkSMXEvEzkonCyAdqOaKTNnIoAhjikZRQ8ZGgqhfGSho7ea39fpB+HpVm3
	 Sss43oOvyHUG/NqlXInpe5pKeKGIxUeZReic72kCwiWAaOEELF0iKAZn93thQ4uezu43g
	 hrqCgLUPkbsBhj8JWrHKxJZXyL0qo+fxj3Wx8yolG/KnUCFosjHeZ9KDMQXGhm62r8Dxv
	 7+ARDKL50k8165aOk3VtT6uhiJxvL+ZXfNYD1qO7FwsS0FEEYaIQ7fxR0toJi9RUy3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
	b=5b+SHbtxDTMG7nbHvqZyFdnqcIVe+MPLjDMPi2TUTNfI6v2yXQYEjPIAvELtsCWafQnX
	 wMpdKzaYOdhCBxTlJzZ0jabDKmxo37lc/QE9zz6Zj2f83R9YkHs3o5njiDHgDaWhBhwA+
	 lPv8wlbr62PJZywTxdpxr46B0oZGsSu0RMSFmhA+CvNdOqU/vYlgwY6PcdmVJgw7rntXM
	 DN2tT2BqleyESMfSQgenmx0sxJ7x6kuM3XdmczDcfw2Tu1GbguZ1BtZklluqvkd3zU2Yl
	 APc5Ju3/ZsMujWsXhj5IV4T7yCdNbH9uXrUpfI2zn4IX2dbSvONeRqUmyvzReMCklyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761C60A2605
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0761C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6B7v3019175
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krTDg+KuG8O
	L20d9UWcUcT8ep5S6DmptVb18MyRohEs=; b=BogmpsSOwV9HaGEeYZRhGS/FtdA
	fmDw6HlGxdvIIQQ0QwfE+2URnTt9Oh6N99/z4SHvYCJHI1mlP3gQKYhf18e87tR1
	VGcb1icoFPq8t+hqaPu2E5YdbfdHyX7AqTXbbL/D82I3ZdAVC2+AyWIvzHAiqX4O
	Do6hxSTWLEmIbjizp9g7yrmykwF3W7gWDCvFhzLO4EyLMXSl33kVE/WRoqwu9X+z
	i2gq9gal+trhnpdZwBD5O+NmESJIGLnbPSW4yZ4v4KyN5+x/18NXD8ZKmMXtG7hJ
	5IUnQEV3elcNT5C6s2+1Dp7x+4ZmFs8ClBJ4NC5X58mQ9pWOBKbh5VGyJAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbr8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so186208685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769347; x=1793374147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=Vb5xSiq4Hyp95BUskdkXkhHCToUbxh98S63reEYJr1K/DIFtkpiFpebyCu2PyrJTMO
         GswN59/G6D5HRGXbyjstAnwm4u1MeMQ3AMHzJGkVjivxORO7fGByJlbLaY/oGXbt+Fft
         M/p2/bTyENdm/Kyr9zmnRUwxiwK7zdXBYKgqNehpTOC4MAjFf6DE1ssZXeLNahYQXNxj
         50uqBYCPzag6lDOKbaPrEZIvdBV6GSIAcX0VJNPL4qtet5CaYBzFU0cZPRKalBvIGElD
         CPQ5hS+Pee2i8eXU6fvduOLDnwHsjxownVJBF2y92jhRDAde4iZHsOhU8Fe+BqLo/6UE
         C48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769347; x=1793374147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=l8TbY5y7IzJL4zyz7QKsU8ATLRp4lTC0bXMg/otYySlnVqiV/fitikAZC0uuGHxdjo
         UImg+dr/HR7vtPuLFberY+EmxTHMVbupcxnmZ58PrksYcA7A/dt6OUfzqB+cpi4xVsaj
         I+rE23xmqCL2JcO0pIEoZ+SkatbIdWF0Tid71YR7EjrqBynaf8zY3A5CAvp80H9aTSsc
         8f2E9U2GabvWu5SuRMZdrgiUhScSiD6ePNB/UEQrg8wTF/gr3Mc6BlxGP603WELChe+4
         QOjOoN+yRj8V388uOKfObNOLrGRNk6VL1Isfc8VFBooV9aPR36RHkGR7puHLeP4+ljHY
         pAHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVS4ywwQXnPQfH5Gh0EwulbccToKeASxqGPxYfWt5CV51FFQW/5R1I6z5Krf3dJkyTMbjYoLXo4OAwtLfv@vger.kernel.org
X-Gm-Message-State: AFq9FYIPQa1J+MughRDBm6AktuUm9szSfkFj6y4jwpktV+M+5TIVDx0Q
	0IA7A8RTy6wOdthVdIqthZNRF1mYFMksTaC+5pXkQHrjVpMJ4hVZKwJ5oifedCI40M6g4bio2tH
	GsmV9Cb06e5jkBVHj0kY4ChfkuOikOcE3RipTAYzVFtqY98GSKSAVskqDGtRRdMIDBPkB
X-Gm-Gg: AYBFou3uwiKHW6YVZkXZvTBulNqvVw+UfROx49LKqE3v9qPqgCV0r8kGXJdRn3l1KY7
	D2CNHdZsc10xaHGRniTogYd5rHV8UvnHTRFxvKjUpArMzC0Qv2iX0ys05TK8nZRlgwHxoGr56EA
	K06B3q9JQBXKMturF0OEaWdfaKxfzCHwUWEENjDrBqQ05GQuWgmx4+3gNeLPlf9xyfdXGK8a83a
	Sijy2TbEfza7loYxJyv471anCFdBsbMRemN2kX+RQaL7CQnMj9rNGGYj/NeqcPbJUCOYvZOzt1C
	NmTOPbe3/3hmAoRSnhDGDn+HIIcY07SQtdXcxqlcauphgpUTJ3x1rW7KPbQ11ACgNZvlKdZRspQ
	DM5yjSY11z4Xu+mxOfjn0m5TS
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506122485a.27.1792769347148;
        Fri, 23 Oct 2026 08:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506118785a.27.1792769346689;
        Fri, 23 Oct 2026 08:29:06 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Fri, 23 Oct 2026 18:28:55 +0300
Message-Id: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX6QCXpOSpXSwl
 vdm1iiPLL9872Q0/HAB/Xmu3NuCdpORzEjPL+eWQM3ar81krd6nJV2/t2g7YV8biczUCnNjW4Qk
 g+GQcSEVygU9XOL+RHetmiMqCuUQEBQE1+SNydwdFjNTOk4sRG4OX4bHFMuUWBVVrNhvQqzIfP3
 daZvtgVHDv2VtKFr1fwSvPP/nlDCPQd9ueH07FAXJA4fUFHhlaUoi/0LoB9NpJNs28hIhoRVo/7
 S7J+4N2W7cKIwLpzyzlzq7eEFOsTtaSl3LjtiRz1uqrUBCkMxkGPjjWGG+Hhfzy2pHZX/BarqIT
 0lbIu8b6g+8vsGuwyji9vdvp/p9y12fvpuK55xcG2Y0HbnWVyZ3xlnS7MRk7kYT4XDy9+pQOSTX
 6lt5z9yVYTR26JnXt1vp1xIcrMw/FAi2yKljo63ge2L9a2GVfAUX+B3RPXZcLPtJ8XGqBbfabqq
 IkChAAWLkOlTpMtUCCA==
X-Proofpoint-ORIG-GUID: Rr1WbG0ZjB6EBsUHSkYLhh07ceZ8jsX9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX70WNZGZwHcVH
 a8ih61lQQf2/Qdl40G6wjll9W7aiLaPBkCxL8QEkX02srtGKuK4iU8bLfF9Jwg1Y2sxAlpqXm2u
 +X6h1bf4fKAImYYCtB/nA+YrVVKKipU=
X-Proofpoint-GUID: Rr1WbG0ZjB6EBsUHSkYLhh07ceZ8jsX9
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb7d44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rPRfP_fVeLzQRQyiyREA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

