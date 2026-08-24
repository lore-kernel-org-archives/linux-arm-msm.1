Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0143A7F50
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559156; cv=none; b=kbYwu6GIYQIIDi9qzCalashxqEZZQXc1NK6MqRPL+50OuhvtWY9+mms4MNOXbpvwTpNOLtY2iMpkkpCo2+zPbuzs6yNKVKXwtHoxS9PFRQKctrUH9GtbGFQDdX+HXjgG9eOhhQiUS5IKepmd3y9PcWCdnXLxyoIKxeEUsDU4PZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559156; c=relaxed/simple;
	bh=lh3Tcxk05NWD/OL5zpuX9U5hLlE5hZNfVWbxM/kIojk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Zm0HNGRE36VzCsMcxVymgkoc6xCuUE2w7YKs6ASueDMqHdOperkXpeNg7lO3P4JsGYk4zeh/K6GiueZlV3vCjm9MLaQY6HF8HgDsW96h7DKpFPNqOPBTbN6SprEP8tENL7GM6fsE91MV0s6qEGAURAJOLx2NDAsnarBxdk4oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0HEcRxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbSz7J0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0HEcRxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbSz7J0Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RPN82602541
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=892U6daOvBsDZR/zID1RaXZM
	26ByMlYVMiJ6EGwCtoU=; b=M0HEcRxnYTnuDgshBZa78TjUPXutXkHGE6dZ+Nbr
	z8VHGNp/oyMPgeM4FioL7a8CgUPWwdzYeG5dle8pCrM4oNmHMI73dT7t5nw9sMYR
	wXOoFreK3uzTlhp6QUDJBq/2e+gj4jOiXRft4WX221wbpoFgE0YeBLhHVt5x/Q9c
	GzowvmJHn+iuRDXg0INOTn712CQvJEHBe4FJcNnki1PmAIKEq99vLHnNkW8325Fm
	OxuqvKeMPQkqlKhVejOMfTFD2NOYvI7cD3yCdmbXWS+zFwDXVcL4sdbyWVkiE6bH
	O02CSPNtZegcdOjJzr66COpyDH/iKgA5Nkp8onXLWNQa7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwwva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:12:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ea75996387so63191286d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559153; x=1788163953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=SbSz7J0Q/3b9+fDF23H4i2f9UKqN71CjpRSmXRShkG4mZI4zH4kzwWXU2Zn/2qEYWm
         bO0CQbIpSf9jIJ6+PC2wwcxDv5Pa+xTnHVEqBcWBjTpgNUF1+WhGFEtaZ8K88+tvDNrV
         tR3bpKBEf2G28p0r8sxYI6fcExTQWqHgm/MahGS9Pj7zzSID95xNeYa0g8fMXrQEz0hp
         Z+fdur1MVmqPFnH6BoN6CPEPdszqVmhpS2T8jVDhOGzj6dB2mJBkMep0dI9RRDDiSNfb
         rrJC3RExnz8fPjOJ/IjoYpM93gxds6GITitJs6fZgg6VMzkH/6fAZYPD/2nb+/94ssOt
         QDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559153; x=1788163953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=892U6daOvBsDZR/zID1RaXZM26ByMlYVMiJ6EGwCtoU=;
        b=YT0uiQT/oJ75g1FEr6LNc/Gox0Db7CV/b3kdEPQNswePTr92dgW5u9dqLd8xfE/C6D
         Gci7y0UimDtg462OGzyQen9WBDfZMzbnsUD4ISz7gw/M/9eoxKZy7ulYSXQldlFx/d9h
         VciNUNoXfkcfGk3lyPpzOQmoG4ZAhmOwKgTCbZHkxF86EUVcALIq1GlqpKEk/8+W4g/6
         IHnp7/yU2IJn9CG79ntXIo+B7IECPhfAdm8pPoMwHcn1Kw6HPkjhEk8g7AksR3GdKq66
         MAM+iFgXNh0vQ7UrD8Wmtdu9Gpe3PKKVdtjfMQl0nUF+sSQ9yDtimhFOkw3VWuknMT0P
         l2MA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4UQ9hVt2azWBVUcoWv+otIXdVRalb5cPsUT3uPEInAaTjIi6uKT0SRwW74qvcx1ZjTVT5k1nuYF5DyrH/@vger.kernel.org
X-Gm-Message-State: AFuF++mKfuZSJpEduq2s1y8ftlRK66f8AO+7HpD3rxQ654ciokZYm0Hs
	z8CWq6zmKvk+QxknsfltAkPXpYIKiIiSSu4c8YvE1JwpfkFbn0gyXRYhtqrnP3Qx2whmz1BhsIa
	R9mK0sEBmcsrFq7JOyr6oUj343e8AkfVnOMJuQuZw74NkuoC+nmDrE3lZ6J1Ayuflch7t
X-Gm-Gg: AR+sD10NMqfV7/TqBpeRjFdNLkeiILkLMMHbo2n0t88TMRKwlyJKhkjAdJG+440Oni/
	BQ4UkqKOyfl22VTYuDmE2oPi62hxgzm3vCMKSrUwd7un+0t2jiNkU07FYHp3Ol6giIkhnUgNEFc
	JnftU/7ovM4KFysQMAX7OdvkpVy330Ua15t8aSO5RpLmjwgcrfLU8/zSEa+zd5gAcoU4o/Fz807
	uzVTpTiox4pVIy1yfgC4etAogdcYYlXzBnjE/eJyCY827C61Cc/Rcpb2I1I5qwkJq4+qW2OyRIJ
	zh177GSJJw1l6T+QVT7cJPBVfv/xYzfukT2ZDqjVFS3IYWcDkCFjrNgUb7UvM1hAzEh0nuOu+0R
	OuV/7f+d5a8eVaDA=
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083841cf.10.1787559153550;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5143:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e09bcd449mr160083521cf.10.1787559153095;
        Mon, 24 Aug 2026 01:12:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm108824266b.24.2026.08.24.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:12:31 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:12:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
Message-ID: <z3d2awmpulr5cwexhso24verb24ec4rsnj4pxfhhqxwezrfjat@pwoxszguelpg>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8rCOyFWknCekaxkB2BtDU01xAc-LASkb
X-Proofpoint-GUID: 8rCOyFWknCekaxkB2BtDU01xAc-LASkb
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bfcf2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX3Oso7xpDmhEJ
 i6Yp8AFtutRVg7WPMtJRrVYpwXtwMEHzxsSTI4U6u5TEUqYP1aveAq8Y3pQxGEd2T3tqOZ8n6NK
 x9Si36zpieO54Gdqn/x849v+48vyP1R9mSgpKy2sKJQzWWm6+vvi5pgM4Ty8v1OlIDZpumwEOLW
 Non5v/scYTyWDKneo7lFHlNAbEHm0wr4a2xnj3txyhKFMPoHlollIhSEcQNqzfsqFvSwwnquOvD
 FWxTLYCaH31GH7mFHUikoeu48btcQwucalySvuElt/MPtUfWzyOr8nncrh6gh3bZ2kli4nI7GGL
 xm7XOSZN82md0E38TeqS7hm9e4PPFtsfH+C4PT/B6xZnOC+Xhq7pRIxh+S3WTA5WcnNSjhalIkx
 dMruFhWPDIaC3bQExjWGlygjkG8bdkQmtn9xhmv81mX9mcPOiA6lsKHNeFMn2C2zpbOKGgyxkXg
 NS1Xajx6P/1KQD5fT1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX6Nmr8XrlJogI
 9eE7pVSwIlyqKcjogBafnE1XhKqmf8IeSJJLPy0Gp2dppBUSW/defuJmpmue6yXRy5Sf+ezcdII
 wlDSqhhAfEX+ADzotCfgPC+UdCF1l0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240071

On 26-08-24 12:23:30, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Fixes tag, maybe?

Looks good otherwise, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
