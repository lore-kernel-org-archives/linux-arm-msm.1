Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782595;
	b=AkQ+ew4yyETrxJ3kfoGh4ZuUtswoYknSfQ0mdHSOvgPqnr+kYAs8iFGFikvwVRTfrmiz
	 CRmmBZ/ZcmTKxPRYPIczt0VJzN8kc2QzOcl2N/uC70ns5//pwWduWQbRvB+jKknz+dtDH
	 uIZeNklhYi9aD3Q6vwrVpgS1rxiLRBc8t5UkwCDMm+uHxDJ6CLnSO+3ILl36paw0aHQaj
	 DEj92+sqRKDsA0cSYUyjhd6IubxZBPNqcL6VBQFQ0WuP9HGG3oZ7q6qwUxSOYJYef72Md
	 VuSFQ1GbOssYVoM8MIMULb+gLHM2Uern2CVzqtKPJDRI4p+ftQgYw65b6dJajaQotvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
	b=KuA1gxO77P9x2wL33EE3EQgYPOyI88po5QCWG3vNkyk2gnzKh1QLiNO/awlYDP1Mz7Id
	 bXPiWXTimnxz5geh/jOdfsCzcTOBM8A15slNTTvdivOG/SqkSQP9YPIDFn4EvNMQhFSt4
	 ejoSCpBJm3/tIt8uU9WGWRyVgeBpQ6vLaNH6S+Pjok5CfhjQ2ybJlmz4beYsA0IJC+iy8
	 jdkzh30M6DGbjlyIn4WuFL2aLiXG3XYkssef+7C3Lh17iGXVLhMOaNmUkatBp6jjxVJn0
	 zPdoQ0KqLlbnh+4Qp2UwVl4tD1jufzCHNvrOJxRoWJ1UqrPil1qXd6DZfommKq5GeKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B56606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApMsO273519
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=; b=Kn+9XV1yfjnhjYAM
	m5dYVj+P/eXoYNTYmNSJH1qNZWewfhkm0SM3xTcVKOtag+RrHL9id8l3DRyn8Q7O
	2ONwELDprTsYla/i9ui+1TVLcWQFbzjO3C68qFgbHOcXBUhdy0SBMATrvTZUSCat
	CTaF3by6QkmdyMSPq6b0f9hJL5lUDTgvcJODsXNUuGaL/iDqEjdFjI4l4mnwK2nm
	92kOtxtb+2P48G7jk4CXiEccoPlQVaiXwduyk4wLe6LabqRTFVIaEid4GDF/WSSI
	eXPRh0CAwhZI5q+LuVJtNKN5rM5P7CZuyrTI8MTdLChjDt0Rv9YbLG0a138evwZC
	Zp0qIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49aykj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:29:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so4094084eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782593; x=1796387393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=EppFsVeaV6N0nyrh8SmbFWlD92Twq6ri8bcseH1Hw0ClUXbUdIDXnx/zhICNljjxhn
         IA21YypzKDFON5Zp6zfX1ouDiQ8pqNO6Hjtf2vbYPTmDOjnuxThEJ45u2JtaSqxlhd7C
         dS/VtGZI5KK93maBCqh9fWx8UNk/y0XK/EUhg7wP6bBPFQlAYglAenmT08JEqbzPXYT7
         cKkpvwBDM3g1rlqRU9sosv93CovAQd86dJdaaG2npd12uSl2HE4snBQzawPdmeerHNCa
         xLX96uvF5pNFchbYqxa0A8KL88t/2g+ZmoN17EG+7HrocVlGY6FkOqYxC6WuAyntVF/S
         k51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782593; x=1796387393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=ZuwLmDbd1KAQrhxGUG3efzL2rKFxzIXMWF+P5DzhFMwss42fiWE0zW4cb9dVbYJsqc
         Au8+giGMMaixiEqkvr9uSOuJJ3EgGQ2kpp09iFO/TQoGkb7P9Xm7V57Q1zscEOd514dF
         4CZ4ehVMuf9SqFiwULip0jx5TYQ1GrLnfZiteK/h/q34PQ34w2Ne9hNmZvpXJChhJAx7
         gc2tithXvvWTDZwNBL0MKtRGi9k4pn8m5i3Jm5Iv//7MMrnSBhb5Uf06Jmgv2CQNyT39
         5UTJEy+f2UHEzRX9OOthprBo0U3mOR2YDe90+WwxI5GVGHR5OF5s5d7Gk9+Bc0CrF7rM
         acCQ==
X-Forwarded-Encrypted: i=1; AL+hErGQXdSHF89iuhEtSrILX8jydv/fuXc5rBvU02cA0KVvCusIxZUDvmEXb2FQky09Cg9NriG02yZPyPjhli1E@vger.kernel.org
X-Gm-Message-State: APuU4Z/b3EGkkjcv/phLCGJJJHTcns7XrXwfyCrz74rotG+lY8hcZf9d
	dXVIoNJqUu87PbquyHQ/4xvYOkpzbQF4yhiPtKzkWcUu1OnKWucYPi45ZG9XXIssuZHso6GiA/o
	+UmNDkMM+Di7lrLypG7XlC4gkXmAZL8Pz4bZfbGdbeosZ7ttms908fgZR5bJ6vDVH20fD
X-Gm-Gg: AZFdTZcKwFDbyo33O4B+YaaSVlx/ntwyZjx9EdG40C+1GG0zO1flmiVI+k0zuySqf3j
	eAa4OqaDQ//xNhUGmXBYVKJlT/Qwp/JR5Cx7dGS+bk0X3MxAcynLtOr0xVKqz5U9Wus6HGWOmqt
	j/S0csugM363woph9rRbdS7Dt/iWGs0f7aHcpdRmjLxmPgqxMo//daB/yW512Qrmy1OgevE2o0A
	kpuGdfmm6pAWt1k+f4MNJMnA97HV4nUeiitPI2vYTmCyf1EvrJth5WBph6SaquA2+Erl9JuFwZB
	gzwmYFIU12+2c0OhfXckGqjHMmxuo634uq67DlmQ/5NivNrX2IdfnFNXEsNU8D7TKUHhQCyaGTR
	AFipI0Z5CKF4Jz4pt2wQrxhxbViJA3flPZyLFWT+FpWWXnYOfO1qdu0vNJs9lx0LHozr/wIJdIZ
	uBOalIBw==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457720eec.6.1795782593301;
        Fri, 27 Nov 2026 04:29:53 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457692eec.6.1795782592750;
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm60695792eec.25.2026.11.27.04.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Message-ID: <042b79ad-6036-43de-8157-752db5d7734b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:59:46 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: iris: Wake up blocked clients when the
 driver is removed
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OqSPXOVgSehYaCl7-yuEJ-XsOhowCU0F
X-Proofpoint-ORIG-GUID: OqSPXOVgSehYaCl7-yuEJ-XsOhowCU0F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX38QPIqqjPNZz
 UjVF2YdICfJTHzOwQK8p3w0gU3wNwbLHydsPaO2PNzTHIr/sqZ2gm9hJ10Br4swLJ2W+g3dFMch
 f6VGeRK1P249VRkTMjpo4dH6dRl2ojQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX5x0+CI1Ju2j5
 Y5rnZTB2Ch9Ffq66uTSZl0D2O/EfA+wRDFz9nMIAPcteh9AabtNrtiTeD7vvlrVYZjX68bNJAAq
 ZBqX3moasb1Ve0JJT6O4tTi4FVxxw6EHpiMcaFiENjqPyJjNrPvKBCpgj0IsxpfGgIml/xOOTBf
 w6C5xfoOKlhVqzQqIqdcuQ7EeAIanKbSnr3EzR8nh20gQIB50aN29eHfqdhaK3YNrYew6nuaNpV
 OFdLh5okZ9LkzTFA4VgFqBG+soDk8jE5xWh5mrjILh6Y2nP1YJ8uNA+UlW3ozb6S78db9vup5qU
 SgT+O3JxpCjuUo3YMl6DIIaBAeg81fyVcGb44ZZgJ9/J4/0wFAimTiEmpXnED/r+JS2ID44kcMK
 LpUCfsiQXYw0X35fwOP62UN4USXGaAcATuf5erL0Q0prAtf16rd382MRhzpy3K7kaJ8nZ5A3fQQ
 K/bjBlrdhH8QiFtdjRw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0977c2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oO3DLwcLetx5d5aH5KEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/19/2026 5:15 PM, Vishnu Reddy wrote:
> iris_remove() does not wake up a client that is blocked in
> VIDIOC_DQBUF or poll() on an open session. The client stays blocked and
> keeps its file descriptor open.
> 
> Flag the vb2 queues of all open instances as errored after the core is
> shut down. This wakes up the blocked clients, which fail with an error
> and can close the file descriptor. Skip the instances that are already
> closing, as iris_close() releases their queues.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c    | 16 ++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  5 +++++
>   3 files changed, 23 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

