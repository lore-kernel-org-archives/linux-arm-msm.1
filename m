Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7FB5476FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954278; cv=none; b=KH0Nq/l6CeHUrjw09LKpNZp0VhGdoch3My//Po/OwkYYmHOiH7/DhY6pi21V7BXwqLXbH8iM5nI1OzTOxcrYQqbBAtzLAyHrxMYUBD2WfYTn/7retEZZXsN7/rvNlXJ+j3y4iV0Hpli6ws8wq9mVhRPtijR54SUCOXbm8zEgmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954278; c=relaxed/simple;
	bh=Q5ojKNKo6HChrWiC/HJMJ65Lk0CfqxwiOcXmEevOK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4AZGCd4K7UepBYHTyVkR7TZxOkUTOFK9l1XkN7KpTgCh/Vzx/t0vJWZyWN3BJI+s09wsFEovEtHfNar4I3rN8T51mozsffWkzL48cszYXArA8kaNxzn5TCSEv2REocixG5Kcm3Rf8PSWipkTYvKyI0EKMwe4/8/QqEajWfkTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouq0vNez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAK5a99x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouq0vNez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAK5a99x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUJ6x2019507
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Z3vxjDucbkBUn20X6eQMjxa
	kCQuQENAXW25c7p6duI=; b=ouq0vNezVu/DefF5uxtof0cFcCI/P9C4ofAaFR+A
	k7QhiVC9Wx+sm1bRd2yHVPp7Lwz0TFC48ulCHzLte53JEOlC5zyTzJaD6SRz4DOj
	fqLqNJATKIMTFJAKg3nLkHikMFm1q/VS+nMRDsyn01oAjUDmmw9lE8Dc0Ianodle
	ctsvzS6U8mvm6WXdEtCW0W09RBSQO4DmRI77eJWasgvaXEIg1xCCQjXZNfh6SjLb
	c0EBY747Q8VBfB+bWD15oBk7j8DJXF7MQrGwX3NwAspYv+sIlgipkSJ1FFNJlMZq
	oKch90bDYNGhh0NcYsDMM8kRE3weuhz1TI15YDulUlzkmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x85w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:44:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso890637285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954276; x=1789559076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=kAK5a99x5t8DAEdyoFociCrb9pXxFZyHuv4kI7M6wUXykbm8yRopKk0rv5W+y3VTf+
         LlYwrDtKNCiuYZSxULZrV64F3fPC+6+3taOcrXWc+AwrKlZm3AJVPf7Za4mCZuZIuJn8
         7SeOSex/ZyuU4ug6/tv9kkC/540q2RUpsGljqhl1cW6SlXONxejuFQjYfAa+0oeXR5CM
         zKgnW2R391MgCucSfVMxy+HJWxFK7LQtV59sq8EwuE+CW6Ci0r2sZYPVDEBGpePmbjG5
         CTvT9TJomsZJ7SOuy2BeGhdGhw5vrNJU5JeGseahfeTvZeag/wk90jqOGSNjrkR67boC
         eu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954276; x=1789559076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=XUzdGt7WFfk1fOwTtm/6cK60EmjCm9lD/pmoYst6waeCNXG0/OTVKojkS+h4RXr6aE
         szrG77eDoq+3lzjm105Aaq2gomFyF1BT8OEyaU1mcHj++AQKWk1+hz7A4CCCXkm5OVbs
         ev6h+rXbw4zXF2Wpct1jI7njCOzQl8b1R/XzPbAxUCkGkH5X9dVec/rbJrkapqilhq/1
         nfOQIwOU0aC5AcZVPieEoFq7fglCUjKSyoLL9KnGiJ1cM24lgUIw13ImkgxWpRunzcx8
         X9KMgnJHLPURJx+xfH07nLZi5Td/kHkQO1pgnENUOLAWjNJdYuSIGLKKojXl0TRWR1w8
         ObhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkKjCVkiUxBYqVE21uFsCRbf/zdiNHZQ/EmxvHsGYW90OSWYg1ZX0oyhSbgU0J8cm3IJ59HocUzlAUOHuf@vger.kernel.org
X-Gm-Message-State: AFuF++njFqC6F96wpc2gNKnO4AAapsYgyqA+keS9PJaxRwfeNwsNqhZp
	V9784COQ4Rw1iUqcKDMlOJLinF1UFYG3ROn3DTlHQ4RC7g/aCFE0uYlQJr7yhTJjchOY4jZWVQC
	zbJS1vRj+2utC6zay7BcmRa/mGzSWYheMdNr98HAQMnxxLvpnBE64GmdnSxiavwuY9e3X
X-Gm-Gg: AYBFou3eOVnqcexBCgozre6oGqwtbLKjWO7mRQb20+Nw3hdzl9qa1U7yjMvjR7gvwk3
	HKqpv+sN+WxDmUMg2Sc5w7nxkdXan4PnaXoFZVab1YxNsRqimJFFGRDSW6dVXxFw+3ivvU5M3ej
	665JD5pqu1HTIScFyDDK5uY6naFUew8Nyd5KO4+PNGLA47MWkFq+CjDq+8/khbDPquYHwDSNCFp
	N7toPp1PJQyQ/FUPLI3Zzb/H0inkFj9fncPOb7ybivCmIsdVWKEB48BHYydRFPoDgbzeLi/fTGF
	l+0YHZlhB3Lzt0/Pa4AU8d9Whtmv1miCFW9Ey/h8OxM2eA6C9FDRvmxvlF7NyaS4RzBACx0CbCu
	LzI1kUvGMK3X+
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614857385a.6.1788954270795;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614849985a.6.1788954270227;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm374791805e9.13.2026.09.09.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <jer2cwmxbsvbcyyfjk5vv773alhivskfhx3yah2biemulszknz@6ievb2y3f6ot>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXwrKFz08yuLza
 HwyU9OnhuN+4nR7HtGATH0wfmu4ICjANRJIfLnVYiCSVeW+9awHp/25Fxj2owY9/D5zoQK5iaGn
 ves4BsLs42TIpKPSr+bUVLFKxwWINl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9MOZ4fmZIsBh
 tz4otIvWuR8zobvOI47uAwKMEeBY74FfsXTiL9VDYOWKn0Bj+vsekusKniHWK0gSnnLksIYdOps
 7M1T/VGbud2j1iXfLGkdZM9rRYsn3gsTcKHalt6rqHdsfQ45EXcMTu9N9HdheggS0tzWWKLLK9g
 yHxTm0bkVGDDgs0Is9F/2FnRyu0XQIY7CZU8szbU2qDsXTWQulAbBziJ5+WK/fDy7DyvLMcLV59
 UbgG8hJaZox8tF9S57T2Lz5qfI/cUZgpre81I8pafpuaRRK5yWFD5IT7+4WQNPTTRi3IjKhzWQ8
 3K6fP6ocoT1T5QlJ/uZ4I6z7nxoUX3ANpUbSxZkgiqAoZWo3fsj/K7QLPohAelkhsnb6fpSW6VW
 jRQBAgq6n3/chbECxoCcNJpPgpv7FKnAswGm4h8jBa2X/8IXSDLLlFgynoRnuhW3K2+GnsJgH9s
 PNN9Kb0wzVol3AhKFnw==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa146a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=efGZWcCWKF3PpBPhZoIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tTr9f0jIMHpXXcPY3TFW74WP0qL-hoS6
X-Proofpoint-GUID: tTr9f0jIMHpXXcPY3TFW74WP0qL-hoS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:18, Brian Masney wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

I like this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
