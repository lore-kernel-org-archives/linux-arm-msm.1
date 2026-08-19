Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37548124E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153263; cv=none; b=ZhrSRYKYZsmmWQgbrRsj3iGiQOR0qoT7vORLmh37oUwdfdrPjmniOMFPplk6l/Lf35vn8KV9i+6qJg4Si3xFYM6N/WiGUDyecWWWF1rKnnXnizQSO22fOyWrTGFXnoNQ4C7LzaWOfTXIxX9LI329fLRpzjqiBvUoLoR0tRZs6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153263; c=relaxed/simple;
	bh=siZDHvxx3lSLS+5j62sQIDeXqihgS66odMFsdkJQn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOA/iZvWybFOb0FVCZ+qOzLdEz4TKbFn39zUo1hPlL+BzPLnTHYuUBi1A2LYAUGwL+tOZ5kVLAaJf7kG6hQZKbIBaIznlgE6Rvi7MIJe3w+T48AxtXPRs3HbOW0ZqaqxY3Yh2QFNugRYbDfP35CwKUquLEavPXxvUuKzhhDJzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGMP3D99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM6RBeI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGMP3D99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM6RBeI1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2fqP191535
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=; b=GGMP3D99kmrzvDWC
	X+V4qVixkFVSmUZa3sDKVGZXq0zU6zl7lrfz9n7+v7XNphreTXFGjtcPXRK5EwBd
	+8b5U3S+jDj7QFd58VyPQSuPw3/PRwgzAqwdPNtmOWWTLMb+8LAcpnryw8+9Ez0d
	v/iXjSKFwupJmBg0cV54+vBsIfghZPvtFWs3GbYgygyvrdztneuHKBpeemDhfJdE
	yfeG1rQ0+qDLMfvn+Hu6S6tvErWwZmxdrXobIcfDhxz0WckIdtnhVwIhoiKkk7X/
	bmYSjWFDgaCbtihwsp8yCq6ltlGzp1fDs0pyQsX9u7aiLF4kpBeRh9F585M47iyy
	nKfsMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc04cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so25568185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153259; x=1787758059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=RM6RBeI1eFTTWnLRTZk5kckExsqZ0z/QbxAKQyBmAGsiX7EyC0FOEKSSjDiQXIaFcL
         TIYwVNxZRIlUA2JuGPgwvKfmbRQJsUlg+KhJP0XeX5WoWlGqrQZCIQJ/ZpJ0e4mI89yn
         5vrhQVrmI8Aw/x5xxXp/dfrVrSk2BLdOlEQ17/QB8uZlg6lqKGbOoqD6YSJ40JYjufrW
         ioX+TXlhpTCrb19ncaYd7r5at+fIGWj5RmNucjEYFiOjW4HoJb/u4eQfsnGCko8RVKtZ
         zaX7wtPvxJQVtgpf4/99Mahjo2OIvkjChGRbakSK6UR/Ox8hzPu7FF+cP7IXdRbwkXJt
         vUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153259; x=1787758059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=pRA5KG4CGKFt1mMZzExf2Z8ZlJp8JFRjMyeLwd7M4DkzItDTA9iJqvmYtJsBQUGewo
         t0r+EYFChZeOIe5ZS03LRbGD+0oidLgAUixv7Q+RCtuAJTFpQ4swReFZ2ogp8NR+QGsS
         GkaJyyK/xUFuiSsaex5UgmDvAIJH8FQaI2mt1XIg8sd+I5Tiesh4at0tiJb191N++bZS
         aP1MrdsR55uKLOL3n4gsLvi8MG/v5C0ua9vpHJczoJl5ky4x71YbPs27C5M/HsIKBKFR
         HFIndcTvvQ83PbofWC8xFDO7OCrPukgSbaL4NdQbDBjGxOkv3smzLOZF6XmfSQ0Q3yeM
         BdiA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr0Q+OW5+2lafRgxpLnkpZG7x/gwLMdu6VzQtv86fAddH0aZnzsE7EYZkj39vS/RSpE08rckF/QOhHYDIg@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRsJTc1EYdKWNWDoXmAlsDcECXqKYni+cG4Z8UvkFhNdfalJF
	w56dfmc6IHgdXrdkKb0sj7lmue0Wq58fyASfyFsQtidXEzP1P7LeKlHEP6EiWY8nlDfMySyyZwD
	Rnt/efdPbucqFKa+Em4DzKK+Z1DQ6gTgKjOGQecMrMZgmu6WD2xRP/S3ROo4FhjOPNEip
X-Gm-Gg: AR+sD13LzKHTc91xx0xpl/2HGolF1AURO+BQjLb39nOx55aFdhKgDYJZ/5Ha2w6gRwl
	z5pYDEa0VvDrptl3LZ/is56WdUfSIWwuu6tAIQd52MBVQ6o+iTAW7IVFm1987VYeoXH3ENzfBVK
	6AKOaOHYLQS+NTbyCi0zDUMTcEhvjPLLnlQKaBk8AXPaz+ImD4vdBAkLo2NGSYpczGwxoMFQdyZ
	/l8ZPVMzOG/pjojmWWt6VELC4hGrP4ULi4od1pWaD5e2/+AS0Vn5vSyxI4wO8VBtlz9a65Ns0hp
	Kwbl2X0zUIpzpGgyx+sIM8ilOqjQt/ruqm7RNUQuYzrWzlK8cNTdsLGWQiXudnkEaTvC18KGsIL
	ysjQ/EwHCPvO9CfEYhP2s2Hcw
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351349285a.3.1787153259325;
        Wed, 19 Aug 2026 08:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351345785a.3.1787153258725;
        Wed, 19 Aug 2026 08:27:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c3bbsm987608a12.24.2026.08.19.08.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:27:37 -0700 (PDT)
Message-ID: <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:27:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PzCQ1WgVaYbvI9yPJo6IGcpoAbz_dOlO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfXxXznxP87tnKG
 XD7JO02tryxlrPZ/4NGqwU5Y8kALxhoyn2p0s/fUu4llmPAAV70FQQE0TlExsHAiqyi8j57Zxbj
 Kb8CzMFot8sfVGZ9AADrX8eA0QbFVW4=
X-Proofpoint-ORIG-GUID: PzCQ1WgVaYbvI9yPJo6IGcpoAbz_dOlO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX/aSGEw2x4yI5
 QozZDdbbdjFeJ6TOrPpU7fvevRoniGq/iZOaDJogfVOmyv4N8XkRVMlohz3Q9RH0vGepqBrznaJ
 uQhX8oENtpdVDotIWh4H7z0ZVOQMGpVeKIvqwkIy8ZzUYbdIxuvs1Jq9X+1PYuuRcwl4UvRkDo1
 lvyNX8qxMkeagfW8I0v2dQICkppa2xge1yqGLFLF9AHjzg0nkHfdoulByiU2v8RSFu54mc0hndx
 0dgaEXu6iMH7ZdmcTAwXIekIJsPslX5JcBL0NwOQWB1457jsOndJL1ujMbsNY9zzMBV6SL78fKP
 ba7avlqOcnqVuSJ9ePuf+CtOFNbXJYDRoS+bvxLHx1MrQ/dAs5iqTLJKbdTLZBfq6ATIzeRuj6z
 dDMmRCBc43Cvf+pAViG9BY6HC9aBthAVfsvfI8n97GZeIu57JVR8u4NeC13q7u0MXBLTAa37AgA
 xTvQDwCr4C+h4ICyMQw==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85cb6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9ngJe6dVrqvN9JGSoxUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190120

On 8/19/26 5:23 PM, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.

[...]

> +	msm_mux_qup1_se2_01,

other drivers where this is necessary stick an 'l' before the
lane indices, e.g. se2_l2, let's keep this 

The bindings change must be separate

Konrad
