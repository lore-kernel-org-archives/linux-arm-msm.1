Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595083;
	b=gju59fixXmC8Rsv/yTEWhRducmPHb3u9bKXR7hiP6+H2ehXIIIGixsBo7/9qABgDaYw+
	 Sk353Ys25EQzjVXOBsCcAXOiSEY1xY6BWHG7hFGltLfUZ9N5NEUhw+8JZkcGlZiaLt+/I
	 4blJncDPj5ryGpaGvsl3CSmlc7NBeRT6lq0PZ9DewOkaAnpruEXvHJrNjWG4CQ0DWjO/k
	 xnfErdJGqx19AweBOBGoPRaIWpztH31YUjfGzLzI7cLF5BCQPInEJrXKVUx1WhcHHfW3k
	 NRaSWbKvFvsEaYHnpcoOzTbRJofvdnz76TvHDwIaF9Sl7zVAw51hZ3jtCc2OZ79i0kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
	b=mCWHCfaMr8Qr25xuvXndn7DNZkCdzL2KgjaNVSU8OfdXdFX05u/9HjnFB+ZhNVK7hQxG
	 MnHzbqYGs2CDrsCJU79N37o8CFn80kQOiGJms0dyJo3bHueeYelFgWYjp0os76FP8mXYi
	 U+hbNazHFW89i/fMPxXMNUUGOHrTwYxF9nqnVNJHqqaYRF+GiqcUEx3J0dZrl64ICBz1p
	 VbyLzmuT9L8OhuHKWgb97+vPTDVISb5u/KeYwWiPvfXZJYPi9YNOnkbRg5O4NtQ7aZYqC
	 w4+TsPuzJEDmuGvJbUvtAZPNEYkUP7RhJJUzIfSk4AerPpiGnhqXAWed7XsjS+mKQ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BDE606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BDE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69uPt1006374
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BdM9Q/xl5hWaDb0Py4CsOxN1
	/hp7PbnoEf6nigrne8Q=; b=O2h9MJoWV/AfAtR5tRhLdiOCEPlZIjiYRe7I4wFZ
	nq9SUokANCf223aBkVUE3agc0E88bGY1LEAtBMpFPh8GWQkWyuvI9UP3p7bDrzfL
	X55ukqheYvA3VMcRGr41rL/17jFLe40l4Lp2dH2r3Olc6aXp9fT6EtFKOnnGBEI0
	tvgn37zO8/0lG79RX1c1qvTJ5ninhyiNGwIWy/4xUZXBOujXn5CteKLRFngfRWVu
	FYpP85RYCAbHxXfHN7CAW/rLDcu6kiqCRozmU0pi75yAYB+fWcz26PUHpla//phZ
	uE5vnGA5KEKmc2Mury7FKdGlJHwPfQSAWRXB1wXCEjK+kg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa295c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so14195755eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595081; x=1796199881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=iCGSPVEdUzQgFEinM+9YpBoWPAecyxV5EmdXArzqiwZfQgvF1BRD1B9IQy71e1+QJl
         YT+xjLDmpoj5aB15NRY2KYoEK6aNc690JcKbaTQ8MiGDlb2CaOEROzSIYlW/9UFLJWQi
         Z0d+Dru0YoaR5clZ1QgCJFwkbV+OernHAZraMhK9s773cVulKiZw7ZIGlFE1Jq/p9mIo
         EraLUHo+/oD6TkrTlA1P8f7gXHO1fWmLzkzkvTlZ+7guRv/Ko6vvR3sJkU+aNfTvtArv
         cI4O3qjIdqpnbYnEf784SmB8swWtLZDcyjdTOQnadcadvw46XozbLsNDVEpRY6f0pcdO
         Bm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595081; x=1796199881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=U8H+pLt38nqhtuWoHmljBsKDF7NM2KbpFIFPAdxirXeUNmP/H0T3WjAOBy95YeJagn
         ReoDpBauL+9DbX+RijzVeC5DMS4pfoiANnC4pNb/cfOkeNroqqRPtD5abLDAX/xUlmeX
         Rfu/UXsHnoFjPk17+eqz4rHAencYw0cPzCUMdh8waOpSr28BnV5pYYi50XWpWX9VcMsx
         ncsB20+EwuWzs23Twk8Eb2s+HrIBFSyzb0Jr5GrplHWTtQ+cGOa8NpyqJxc6PxIH/I5K
         1LKfoeSkfIATYAR1aIpSkKblpD0X4NHBVRZvDhu2oU2nlzSauj7awewi89dKQJt/QXwB
         QRCA==
X-Forwarded-Encrypted: i=1; AL+hErEEOesnPyqxdHccjIVKaY7bQ2L2g/Q+EYqCHjwJ1CQJoSeVf8yJWUjxmQot42Zq6PynCjwSSTFS2Xzwt9vN@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpDCapF5w0KHgwcmWwp17O2/8bOEodOCEjDPXULzt/WL1x0VU
	F7PpFyzHeChaW4it3aSNMcFlmJxrJLlF8Xdf7DCbPYd67u4RfnRDukkNE/TP666nrROYRvGlXd9
	Mf2OnlM6pbqTrzzx4i/sQtfqb3xVZDP2sR4QEd1+KfvPTIzs5dhan9SZkicbw7V5CxJh/
X-Gm-Gg: AZFdTZeqmXysII5qVS6bTTj0bI08Djrqr5dGaWD+3a9UeUEuDTbnm4Xia6ZLwCwhwZm
	ll8a6cPznsDF6ylEy8o7yMZb2eD7ubFb8ifGATrsLdozkXRJl5T62f69YOzGZ6/y03w0KGqmmJW
	qpyhs73mPtRwOY1ZpO8gkjRYckMrN9GXdJJ0Dxpr2LFOn1xbu3F5YpyeHTtQc9kwHlbgsm+WKrF
	nkd72yfemrBLSm1iOIR03lAfXxzF5xGKmktNcXpFzAwECN8XYXwKjLViVfZXcPaCMnya+SCOqFL
	UP3heRkDtsV/aIQdrDGo/avCAVp9anewi6tB5jtIzJJK2nGzoi8B7aFqV69njDJPORVUifP5Nua
	+dJv5b3HR3QOb8TyPD4URjCccxN7dAEExQy3ItlIY40cUxJFaT4peRX7r8xtkezC6+X4TqJKWmN
	6S
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029649eec.34.1795595080887;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029616eec.34.1795595080217;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48573083eec.16.2026.11.25.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:24:39 -0800 (PST)
Date: Wed, 25 Nov 2026 13:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YzcwJbiwEFl7xnxi0t3mYd4D1OUbp--A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9LhGikcaRfnS
 IiTayIvmF280LgQsbTvtDvYju6Qqep+17HhILJDlWRYJvXbbgRdWll/YACHSZBif8JRgR4WQJH/
 bGNw8i32stXyNnPCJg3uiCTW5Kyb5FM=
X-Proofpoint-GUID: YzcwJbiwEFl7xnxi0t3mYd4D1OUbp--A
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069b4a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXxKwWYrBIMThi
 uBHE640xsONpQGGdKhI/zZ03NjG7R2bew41cbJN9tB+6abVqp1FMyvL0xnXKnVfTcAAg22TsHAs
 RGOD9I1kU23VBe9d36r3BlP69TvyLAdaAru2UDSJTE1bRIpp/sDzce3dNnZsH9pIjKaq7L4BmMB
 3vfy0sf8GHdpN/paB2bqIiS27rigofsdmnoudroKdpmQw/9DvaTQfLqtLUaqCKiPpFaO7ohW9Kb
 MNtwUjiMQ2ZPoihJJ69asGTIj7zjO3E7lfmrsTqWnVVrXKkAcnkjT7VDElETY8aSFIJkDpsToUx
 fsj0AfnG6FkW9cvlYWgeQoGgv7RRzCva3JTtr1SpybARsX/ASAA9/obfwS8dOgq33sq6XUYSN76
 XiDFUYPXZC5ftLIyC63MwdIVFKA/gsNJXsIL99Whjb5wv/N1dhkgJ6GZ/iNC1JyZO8m9yrClQUk
 0Usa+JSt4M7VfFHBVoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
> is specified via the iommus property of a video-firmware child node in
> the device tree. A firmware device is created from this node and mapped
> to the SID.
> The presence of the video-firmware child node is used to detect whether
> a hypervisor is absent: when the node is present, Linux manages the
> IOMMU directly; when it is absent, a hypervisor is assumed to be present
> and these steps are skipped.
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Looks like it is almost two month after which you posted this series,

So, I posted a series to move every mdt loader user to move to new pas load API.

Please review this as well.

https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
