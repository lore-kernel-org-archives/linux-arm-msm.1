Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE013D8115
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279083; cv=none; b=eN0h3mwcZAQ7Cgaiib3GBptL9Ue7Wp++kWlmR+KiXS8R7li6P82RPGOqRMnfem0khTxxx622U8pGuszZ58uhSUS6iAdUAfd7zNdjKcJcmqItgv537XN4LxtFBPWqwoxjkSn5VAtFdd/slsYowQeuzqYRlfE5D8ZgjytzC5tF2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279083; c=relaxed/simple;
	bh=N28iiYVzeRpWwCZMUhXE6y6inhlFg6TGF9ayRfgenPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGqPk8kiTxNksf6KPPjJFjBrTsmdIN+sWK8kIdeL1/+OR8rAACGaio5im+r2NNWD88mXISBd2B4N6gF8qnIWVEOTz2VwBGpCEJWkgxXOBAxflkeW580VD+fTsXD/DboFHlYZY9SaUVg4IjrKcCzZIgiIc0NAemh8bR+s0lCDNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbofgccD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O985hph6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbofgccD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O985hph6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e5TY095557
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A0veD+NFMlS2z5CDLY1LoPHI
	xhJ/IEFzG0hI68k/Ono=; b=KbofgccDhV6gap1rDHWn8ghVXM29x5bhKZoR59U+
	TL+NpUCKlgu29qx4UCTiR8IzZ0buKSpOlzVKuxtIxveKuDgLlzMwX0ziKH95QX7x
	w0YsqQ15WHkUxCsbadwBBi1G2GjIJb9qR/NTjK4bvlXZxThhlcLKklxzC+5X5qGt
	aG/roHXRndob9Ojwz4kiD2UbK0dH4m1ZpoqvNRYcJBTn6XG29jWbX9U0lih37l9V
	27Claer4mT6hZE95TsAtUaUq7GP1TwCzTBHlW2B83QEpwKZNf42bQw5a1wGsgtff
	39i9KvScqG/iT9Aohyh+7aVv0OtGHMYFsKDbuqJJjKMwbw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jy4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:31:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5857196eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279081; x=1791883881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0veD+NFMlS2z5CDLY1LoPHIxhJ/IEFzG0hI68k/Ono=;
        b=O985hph6PpQOGQVEl4xNdr6zWbdszpTzrS/D0NKpVhvC7sVhbzia4MEpXNbyT3OzRk
         Q7Kx7UPwPVEdPtTfPUV2u+1B8QD9/QW+sRZ/C3seaWMUs1zK0oqjTTnzInnabUMBl1vS
         jk1graPIzumVk+3+hFgHTcg9sRZouj8PU4zPaplgiC6OHjlDAbRe+WB35n2tHfoEJUWl
         dDXLEYo0L9ZDEXeWoXdKW6iKgj89JcdM3m70V2uyjhqmCA1gMd+ic4FkhQgC0fu/RR6X
         8yvk/KFHzyo4W37baA8OgxOqJIz1QNNFvdu9/VidDNfRN4GmGzi+hV4Sdd1reywxbl/M
         TizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279081; x=1791883881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0veD+NFMlS2z5CDLY1LoPHIxhJ/IEFzG0hI68k/Ono=;
        b=hOs1YoO/zOQv6LIGAt35uWT9J3rUEHESKkaDGZBA+HGD7fgBPOTUKuqrjIIfCyaLbp
         MI892dAVEbAhlprzCiEu3LweUPXVKeYUmO3nXZAMO5LjhTTMGf4O33z86qAZP0lli6eo
         +O5N3TITu1EXhHGPs03rCZVKTf1Jaol76L6Cs3RRahGN4RPOdTQlZS5pVWbpgYPt+Bcj
         3VX8s1VCzio+QakOphYqTidZ0PIrNqR8feFjEOQFFay/RPQGVfFEMiO+Nbq7sTkPBCYJ
         LdGcx+nk6nnbRBF6Wofq6DhqmacpYYRR2WG7j5BYqxBS0KU0zU5MTpm8n25z9ou7Jhhv
         jMGw==
X-Forwarded-Encrypted: i=1; AKwUvBzBhqv1QIZydCv6CqleLB2Ocfbn3Rc1yObXR/w+7vXpA58p1p+XSw3IRzhRJuVCtL42YesL6GIrkOwNqU7O@vger.kernel.org
X-Gm-Message-State: AFuF++n5dvtKEXOX29e7Di5QgbtU8aiGYhFkkI7vsvR8NGib1BFOgcqX
	RfHjWe6BmX97gzYhEW2ahUzfIupoiYNqbhCrF13zQV7hM/z8g9YQgTBUiYzkaOKHPUXl4yF6z6q
	SgXvWSwAWrYGfSir1N6w4DJdEoauiuv4eUwfxinYbyPGEWgMe7EJohHwFUnTm5wCt5ldd
X-Gm-Gg: AYBFou2pTbsOCfS92/AMirVBGmDDkC/u1NpyKep6ZKO/kIXX4D1JOmnrQbFyHz8sKkx
	HEZq16+EKQ46/5U2Vt2mBXD6A2hhoNNrcA6mVRdRa5Xxirc17zyJ5p3aK4toO+iK0LSVqvqIqFE
	hdi+7IIgwMU0xyKcoLN3omJR3pC4/rb2Da5R+BclhiWEq0uiJlYQ2lDmxzkqegaZxD3k0SNNhyb
	svYLahhJ67uDnoGYZIbIaCimPeZPoeRNnE0voVc6ea0/Te3pJlTNb6BBNEWX1brRsgnikDT+y5U
	rpTMSh2BsvQvwyZDtnpb63XG1zRSebiTZpWMfZmNUVWWfJAHLvTSgo3GKOcogKsGO9FOy4UBiRH
	38HqOW5+QbzHFU/URCH8VTqDgAg==
X-Received: by 2002:a05:7022:eb47:20b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-15eca35f11bmr1199902c88.26.1791279080873;
        Tue, 06 Oct 2026 02:31:20 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:20b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-15eca35f11bmr1199887c88.26.1791279080274;
        Tue, 06 Oct 2026 02:31:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbe53sm5153692c88.3.2026.10.06.02.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:31:19 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:01:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mailbox: Remove redundant
 mbox_controller_unregister() on probe failure
Message-ID: <20261006093114.dwtzhpfv5bp6xk7d@hu-mojha-hyd.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w6qTDl0D9xoewUsbI_NhtKT24TQ8Fr0w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX3qZNlJKTnfsn
 Op/jfZDeEcav+ZjWHNeW3yd0IpvRGlbzkQfX+z9/g/j7ToKxj6FhRXTl5JX7e3ygHScroI4zccy
 jUkg/iMLHyRCo/EBOOSiyBbdIN//1sE=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4bfe9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wN2alEwRXMQDqMsIGcoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX0rZp2nnTaSWv
 cMLaNY96eeZ+aAeUobw6iCDrpMQ9aqTyxv0LFWoa+gQLgp/r5DenjAnjlx4qF9G3ppZ8dsSNIFZ
 vKz75LXtjnpKFZl+i0piWOJZQ5MKzQB28+7ESQfeQtmbY6t2MTA5RStzxMmgg1MvjQZBcbQcWyM
 sAJu2nxZzNONNhueJWb5LTKKo/EsLLY5kO0iG4VxI1gyp+SzMq0YJlIYw3dGO6BW6LoajPk8lVf
 mhDiCi6OnutDkNFUkN/l9v+qpoj+T1hQbwt2VhRHUq42EBBhXZbzML3XJYA+rvmkBtSrSYCvje+
 5aYlnzVaXv5LIsb2qaxA3HhXi5eFFTwHN0zsuxrYCw2d2O4/1w9KKw9i2fyyzSQ6zAyppk8T7Pn
 2j3l4y3p8HOjU/7vFU4Zksx4iIB5Qan5dxHF6TPpZ9DtqKS+rC/j3RvByFgxnZyXff8qWBum77h
 k+fLj9J4syiix21olsg==
X-Proofpoint-GUID: w6qTDl0D9xoewUsbI_NhtKT24TQ8Fr0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Tue, Oct 06, 2026 at 02:44:13PM +0530, Anup Vishwakarma wrote:
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>


Avoid sending cover-letter if there is nothing in it.

> ---
> Anup Vishwakarma (2):
>       mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
>       mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure
> 
>  drivers/mailbox/arm_mhu_db.c | 8 +++-----
>  drivers/mailbox/qcom-ipcc.c  | 2 --
>  2 files changed, 3 insertions(+), 7 deletions(-)
> ---
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
> 
> Best regards,
> --  
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
