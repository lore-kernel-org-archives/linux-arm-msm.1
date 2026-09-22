Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB5262FD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073783; cv=none; b=bAiGhNyeo1QF1Su5S3R5R3/A6FTkb+3/xDZAdXIVRz3rVublYsiOEDDaNFEhZHM/uViKCV+yLC6uNEHbQ7ApbPHCxRlKstREHS28Ql5q9dhigezluil0v5/P6fLBoz+h5Uo6iYMKajObNllIZmQfOK21jlKLuQrrDnoEA0TFfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073783; c=relaxed/simple;
	bh=KZ7LDfjgK99h0rqT2h7/+qswU4SirQ0LGfdZbpbfHv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFuuqNVMRR77ebH9nA17NLQsn0zulnXXj5N5NpAjHpe7/Usr7Z6ChsmvL+P+gXHdKmBFLuMHaiEE36zMEd9F7uoTpf1gqFUTyjWaJ1FxaXWjuJj9MdscA7KTxZxCEj1q9ipt18FWwRj6iDtQOizESkeC8frvFZRgFHq9ZQqSwoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJB9GR1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huMEZaQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJB9GR1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huMEZaQS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8ZJZI3675294
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=; b=YJB9GR1+n22mtbrN
	HZ0ji1guaaiWDmSLNgO132wxfQf8PoPvcDFrDWGpq68akmvmEeWqidQDR1mD1VJB
	kXjbhBOiRCMwuHNNunIiYyc686BQXgQFN4b+6xOs1Dqv1FvWvO7Xc5zpunCAcR0p
	sqZ1Oe/Y2DkuOcfHfa5yfSVZfPc7rVtKoDwYqxfgiAuJu4N+WnIk1IqcQPZN+VcP
	r+v4BC3HD3DQLaMQ/ocRu6DdLqCmbCyBI3WAuCXkF/uqn07xFIpNnHFmxbDpnlhh
	jt1zVJFUksQ8due2INtoinD6qgzYid2V/E2HdBHRd1otnsXE0iDERPWDiA6lkSq3
	BvSdPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5srsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so84031585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073780; x=1790678580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=;
        b=huMEZaQShoELpqMDNPj1xmPyd2OqTg9B/O/cLXMjSNYRJ4HBJ04+QEqgSz8Vn5MAzW
         RSM9OZqty8czjb229otcUq0B1dptp+dV7qS6emAZ7AVxe0aqqGOqtJZFa+Rt5DLPTRSr
         hLnH+aocLADjgg1q92QYZ5pnSafrBTA6SwniX1+4JUK1gMt9YdXURxpbJZGSfAaGQ85j
         WSgK/q4ZooG3HmILQEHPtyvnBk3Opm6No+R4rIH0aiiedrCRK1SRwm+v/capjznhxjqj
         ipUMCAQbqC06Ye9i/i/IJIDcVsqW31eQnryxgGyLiHsF1Myof2R4YpKvccLegtIVIfRi
         sMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073780; x=1790678580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szj8LCXmwBCVON903BMnYaeBjgQ/P4huZRwP230o8jg=;
        b=l0N58JSFHhpe77ei4GMXI2WlXcrQKHCe8XBTWlcBZlTQ914TgNpVxvRQ9Rxt4QyuDh
         X5r7i6hAKaBklyR8f42o/ubgPDQoIDa9MwmuXKSDXOMoXCOPRlzkBCw/qE5/dxYMPJgh
         r3mdO/wQauoz9ACdAjzcn+acxfKnO1J1w46nQcMkkgfjOmGLU4GHqPiTAm8WCKRNP+Kd
         bOQMsJsF6F8ofnsfd+TMOt4BXcOgoMdoT1hGF7zNcCIJui09Ghpl3beEVbr6aURZj7u2
         Eh0dTCgARuGjWpTK12JZIFkqdOLi9qHzxzLcMK9gH73+XLAER57cpXKoBM2cp8H2yY4r
         ne0Q==
X-Forwarded-Encrypted: i=1; AKwUvBydo3tXzKH4ucA0/0WH9ZUOCb8tPsNtB1xPOtGmlOzT/BD6aExHZfj6cwPD23BoEINnLUWWY4vvadz5692w@vger.kernel.org
X-Gm-Message-State: AFuF++mtvo/iGkJSrqoD0ami6yB/Vd4F4Ca/OlE/m9w76HqOBQOy5zRw
	nK89iC74GiDvMSKhM5ZNX4uAE4tTSRudsEw8w6LWaUTl7yZFlYyPetVItL2CVLvIKe1u+vJjbK9
	/bC1sxhz7XOnSERXvAA+lsoH+Ww/g6FAZYtAvI5RRxB9nBVlfQjikZ0VHBs6oRUYkWrVU
X-Gm-Gg: AYBFou0/bsveNurNlpaXpUTB4WcV3x7SI/sOBtlruwPHDTAjUdeAfQ1f1PxkRp78DY3
	lLrzyTyowc1qvyxvpYXYkMtfhugy7ZMdbEuvBtuykaFSI7ggrxtTCFyJsCwyu5WLM4CShPAO3TJ
	kxN4rwoS5wwtfgl3BKuPQoj6A03zKVGRIR0XUoNOBaFPyB5FjqrZWCIyO22p5Jor1BMoUg03LLy
	6e7/hkwmy6Tp+rFBCTZtdxDotLZNWirGL2lA6fOv6n2KZKIUmidQNYLSq1cM88XJQgGMcEACWn5
	QhHWUVMwsMyKQgmPhSJ11lu8su0CBxbhdLQNByOx9BSzM8g9hjq0d1KpjdzBMGoqXCSdD8pIAFu
	sG+bI3mVL+0Oby9vpSd6Dpg==
X-Received: by 2002:a05:620a:471f:b0:92e:6485:f640 with SMTP id af79cd13be357-93c1602c1bcmr496924785a.4.1790073780556;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:92e:6485:f640 with SMTP id af79cd13be357-93c1602c1bcmr496922785a.4.1790073780203;
        Tue, 22 Sep 2026 03:43:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44d2015sm845336a12.9.2026.09.22.03.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:42:59 -0700 (PDT)
Message-ID: <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource
 table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OC6q95d3aA9YTuTV--G1XrQnq1a2J2cl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX/gFgeDZ6eh73
 vOI4QbI5ntehlYswbW6eGCFgejv5HZXasN4v90ilYIavxbOBfTHQVglAaPJwkyjfO8bXCgS7Yot
 tcaSdN+6WpiPC1Mqa59KLTLzOzGhqnY=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab25bb5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z8-NgncP72tjiTkV2wEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OC6q95d3aA9YTuTV--G1XrQnq1a2J2cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX+dA57y/WdSgG
 XlVrKyPtJeB+t3bdwsgVpSRj6t+slB7r/fd5CxU8919pVNwA9Idt99R2TgUza+73y/4keRT1odI
 V3tPt+qmH9h/MeE/6eEN3f6GqGJpd1VRG3UCte+/wBA7H+lZSzyGf/zMW+ZNHiiY10OBe6FZIyk
 0G2vHwtmLQZ+J7gVdztpMn0UXeBhXmwCyQSLQcUT3uMCWRCVQHLmZEUHjgcRWN+S3fOB6lQZv3V
 MzRrshDvs4xk4C+EkQ7WenRfsHDzUwKsS9LJAI+fMDkiYwkCLjesKLTtF8eLVloZuxg609ry8BE
 9OCYD3Lylwe2NmAnEWYxSzm/fbrCcfK9XDS3ltmAY68Cw9jVumO8/L3t8wzx4lCDTPONr4TMHXY
 +yBagUUpznbMX0p6OAhi7oF9e6OuZi5/66kxRf+FpUr8ZOZrlsq4M4/IHXkrECJojTdqAsd5iDh
 uPgD1eo4pvbh3RvhO+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

On 9/21/26 9:56 PM, Mukesh Ojha wrote:
> The PAS resource-table query may successfully return a zero-sized
> table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
> which is stored in rproc->table_ptr. The remoteproc core then
> dereferences this invalid pointer while processing resources.
> 
> Treat a zero-sized result as an absent resource table and return
> NULL after releasing the TrustZone memory buffer. This allows the
> remoteproc core to skip resource-table processing.
> 
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


> Changes in v2:
>  - New change.
> 
>  drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index df20773dd754..b5959f833dd7 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
>  		goto free_input_rt;
>  	}
>  
> +	*output_rt_size = size;
> +
> +	/* A zero-sized table means that TrustZone has no resource table. */
> +	if (!size) {
> +		tbl_ptr = NULL;
> +		goto free_output_rt;
> +	}
> +
>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>  	if (!tbl_ptr) {
>  		qcom_tzmem_free(output_rt_tzm);

^ this hunk can additionally be remodeled to jump to this new label
too

Konrad
