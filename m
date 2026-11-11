Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386107;
	b=5dBDEY41hVaDth5DMGLjn1+vg6dtQNTdOJeSv3o0OyDYknZDcBxkQZHJnU0WBXJOt3UX
	 HO7sykClfS3ncIFzzvevtzHC3B2FD0DXrZfvwKrHO1gnWLrfgSe6F6NCplghioKG60dnr
	 XyiKDPMVi9FobJYJe/JllWGDnivKerd3vQ4lPMdFemDM7mPqi09gGIM1DOn35lFlxuU+h
	 2nU+7WFqZRnHCLIDVvW9/+8MPUdllUoo/2/ApqxDUabx4/PkbtRAGVlmYedjNf0ZnxLKE
	 LWa3Yiy0Z2wir1zyL2AkMYqd3je5JzjjMeh/RiclBpyLIhX0AbOSk9q7FQZzlmQeQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
	b=F7IzMtjhXz7ghd+AIaDZHnUQ6BWwuw3CanAsrRE0KwMbgPEkui/rAs6MJTeLqJde5njo
	 csLQsE09stU8vtC7dtG4ffk5Ue0nYiWsPW+PYg6yN8iE108WeTzTlWGtD8T9t5UjJJn3c
	 4KX1Fl7YJjW898P8cFyTqjzWil53dq6zgC+3ng4mfKtpVgqVkx6fKBHN4WCouYb7TEXFd
	 okjUsl7LWFUHL00nNL5zvhA90+GMkiGRfdSjiy7K77Wi9MzVNRd60VUAMVKl+KaXCejO6
	 5mfL5dny4BnwFPV6kTABGHZqx64poaM45jlFZwD2nixXNNHSoN792qASyMDaOMwx9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A4606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8A4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KKNL2017368
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=; b=G3MTb9Y+8weOGt9Y
	0+2hSI46Wr9+Kwaj1870IOXSx1KuhQOGseWxevW0WyhgVw8JBLUG2173hWJj4OEW
	SHDGiOZsFx65l1TAU4ZmhIjNGzBFh68P8mW2IaUPqq4ZA7jdV8tVgdjZwEjw7e6i
	7riyufEhiwVMl2YbnQkGk2peswmp8dJtiOkc2ohko8HhjjZMSwMhSThbEFgvdPxC
	kWJTzxN0DUJ7vwdeerFRkDPPFpayGrBrunj6h30UpPUfay7A6PzJy4NYhC3bubv+
	D8uvY9d2+8itGgJXtEs2+RwMd6H/ZDeQJyPcClfnRuiNelMcSB5K8mnmDZZWIAZ1
	A2vm/A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cas6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3925877eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386105; x=1794990905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=ZjdZC0l8oV+sMnH0NSJcrkNuJQVoBfua7bNYTbzZwFz2tjDbhIxUrFCBZoixGFzVhp
         /9mFjptd8QeOxNqSc3AyyrzXePt34abTWh0ZdRWDl3V1KwPquP0lLwH+anVIEL+PiUbx
         gyMFVzoMHHFMTBpWqMFplu3Ao7YnWZXiHnb7PUaYqAaOpIyAJQ/bChRkugTeSY/PqqkP
         V/YHVFwKLuE7dJEK3PFLX4MBM6ktzY7Nh6hYXdATr7Py80qv1iBfljQoUWUJKzEzdlT2
         1JTtiSMReW56PgkDo5uAADv777jSmzdQd6kBPcbXI4yIdJeexewW3gzCRVnLnsrSr1sJ
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386105; x=1794990905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=Q329MWcN1yoMLyNX6cJN9bl3BSKe84dpBdxMrWeAvZDANv1P1FaEbV/3MasdNnap2j
         2BoP0cCN6apUyIx8eWmUDNozywzr8uOteRWazBVcVFn32X7QrQJOWjfFd8GE9+y8t75+
         PTb2cxZq1z0SXl77edF/F2D1tZnqiBgeLEJgb1or8FeByeaGU+M4Xp+UaIFf06chvxRA
         0pxkaMRjHqB9tZQYaLzrFDTyd6lPnqqRCCP/NbcpG7UGKxkeJXM7r6K4djayNLMsgXqe
         Y/zTQJPjd1daGbo4GVZDRImyH4CsHrIcjONWieR8tgsfSplUU8lfPhEeiwXvOWg+xy5m
         Dicw==
X-Forwarded-Encrypted: i=1; AL+hErHpXzo8/FxWFytj3MYUK6GkIjwkj79GOK1C5PpL8hMbqVxXZe8zjopQzu38ZDnHyjrY20TJnSuTwi/CBrvt@vger.kernel.org
X-Gm-Message-State: APuU4Z/ftCHEnOgBG9AlV/mvgBcWNIMJzjDSTLQi7/rst4+QgISu3KsL
	xtDVDqbcUvS4NryNR7Q3VYrkGV7qWbztF/bvDIL293s1oskzkK0BdOyR3uYNuqZtX0Wvsl/da8f
	EvCm714B2UQD6NeE5qu/ay6zQIB42gvJhiC4trMHdztONswNtkAFQwa2Z+474H/PxFOvj
X-Gm-Gg: AYBFou2p90bZtGeSA65qCefzV81EQjkeMmUDHzoMqt+1JqS2A9GBiRzDNswldHmUQpx
	UHE2tbCeTwIQqV1Sxk0zVpyxpmV9rXn/b9l3ApYbGhesv0565geYIUwR+8s2XsWDXsmYMrmVPSZ
	Jz+lGWnzn7ZUlkSN9WOkm1EgkfABU6USWHWtpCpQkNWMQWTVPlQudXj/20F2ZqZNm8jTHUN5v4V
	rMRAj/nzWNxaFW1M9odRjOoca66MGWEf8OqMsDKUzh0zZES5hrAFp52TvAAX5HPoc+FudlLMyMd
	Iuk7457jXaENrh2qkeS5nvvEyhpiLKlv+6hpuL9C7TDPLrFJGhs6nB7aRECyXc8KVg7Lk6WD0YZ
	NJXCWUoLpITHPVtjxOfsOob8q4/p3lkq+9cDPlVpbDSZZBONPYt1RXqzFEbeQ88o+Qq5Ud1QqVQ
	m5uU0=
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633529eec.10.1794386104860;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633472eec.10.1794386104118;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm21766474eec.22.2026.11.11.00.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:03 -0800 (PST)
Message-ID: <0f24911e-83e6-4de7-9af9-3c1bd3e143d9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:04:52 +0530
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
Subject: Re: [PATCH v4 03/25] accel/qda: Add compute context bank devices
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
 <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX/vFvP3P2pXK6
 BK2b70qLVkMJi1k7LhRckT+ko0H06ST0NZhxgmCkwZK6vvNLIlXiQ4TJiPeIQ5SfOK6Z8ANUYoC
 Qz6xuBNAmcNWZ6MT/YDcY0CifND3iFi9pmsvLq/zhxdIN6jjPuQlAdTEY6+c4QeC/IvDzb28ZRJ
 51Gwj9IYh8PfjBqN5c+chbJ9KR2uvRysn6h0/eVs+slB9obM2v2YaNrk++u/ZLmJBtUHAPsWSCt
 B8gJIs9oFHtmmhpMRfGOVf3vWvi7dHh5aBiu7sjx4oVU1Gb/GQpl4LRSeU5ys/uow8craP7J8Xd
 GVu0A7aDFh6LOBNrALLC+6DyCrfXMSmbGY7DL7n/3MSUX9sVfKKUsG6JWS2qAwnk+qjfT/ssw76
 psVbo+YWSZPWcFmWMQOQAHqNYBU1cpH8uIMZKuBoo8LjlLlig2vNF1HH05E1z2NDVyA2gjERcNn
 vMlrW1xMLtMqvK5Bs5Q==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af428ba cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_YfdpRd3OS4PFdmd1n4A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: rbp_Wi9lteL2DOoqJba73RZmjKsk0Svu
X-Proofpoint-ORIG-GUID: rbp_Wi9lteL2DOoqJba73RZmjKsk0Svu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX1HAV/mOOffiu
 w7NFEVwZ+ZORbRvdL2bbznZOXeXeJi8Nf9S435vPTRGzaLRO3+Hkc8e3GgnAx/k6xd80xDclzd5
 qfuBcRSv94b7Re83+qDVI0zmPEHekHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:13, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 6bd977e8d68a..78b5f31974c1 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -5,18 +5,18 @@
>>  #include <linux/rpmsg.h>
>>  #include <drm/drm_print.h>
>>  
>> +#include "qda_cb.h"
>>  #include "qda_drv.h"
>> +#include "qda_soc.h"
>>  
>>  /*
>>   * Both compatibles the binding defines are matched here. The glymur, hawi,
>>   * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> - * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> - * attached as match data by a later patch, once there is something that
>> - * consumes them.
> 
> You just added this in previous commit. Why adding invalid
> documentation, which is immediately removed?
I'll fix this in the next spin.

> 
>> + * compatible and so are matched by that entry.
> 
> 
> 
> Best regards,
> Krzysztof

