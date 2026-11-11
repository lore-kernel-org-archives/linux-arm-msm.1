Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386217;
	b=5tfDJYLK6G6SeVVObLuAXc5B/WFbPzSMvmCTZjF4UX/HBPnUMBDwz9Ef1xGEbTov0WJP
	 KEUmYxJ8Z5K9bD0OfM3eYbSY0QY4+UXCSFNlThzMleRAp8LzpUlGW9mOJ6JjdzNAWZmA+
	 nkJiipwci/MeYtfQoIXBT+UKLs3Tc2fkl5AJ3/womT8uZJ/p1w63wCMiOxYjE4GI3VxcO
	 gDxL6wh5zziuNTJKoJzCN2M/1jfV2Mp+as9PCnUymzjJgu20c1nKHv8FbWai3G+NuZzcV
	 BzgLIiJRP9Xn8vomlHXGWdPolBEPiX4d7iJwXH9UVd3IdfZVODO82EmqzVqBcRf6WTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
	b=eLoJ0nmtPNzcwOyfqkSYWNZZdkTRiquPbcu2lQ4EHQRkfKSoyT8+g99ZtQ6PqFOnG27W
	 3IibqruQ7XtBEWdU9fpEtvyN8CJGXhtZlqPByTGeme6cXCVRHLJk2HNpPKizJdGy15c2N
	 RDwlV3ZKH5BhxQXwbnCBGdqySCb32XJdUjmc/uGsgTF1UAHutuRJfKgWUjtcMvUwgEPr+
	 m63AdJjbexYR1hOtyX4dIE2vlGBexhX6znu2whFtAV3ovMRedJ8YZWUyZQMpdsMFTcHeg
	 Cz0XD5ALQNZkNBLPTgmaQmR35/Jz3b8vEozcZX10z6+2wNbKVIxTgJVNuElqgQO8ryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555F606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B555F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOjj1590039
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=; b=I+e347Nr8kQrrMhv
	CdfUv6n7OT4zzKr7jAN3iOK26iVfN75BV9KR1z7u7uGfVenCJO59oapm173a/luI
	FfEj0V+4oofjcwJOFv9O7cqlijPcNIkwJwuwLq41hPyBL8b3URmI9aHmW1hXxow1
	pES6YA8Bj6K6bnMsGxxnzWUVtBLt2hZ+vwfQu+Q3cO4CxgCDUzJu4yrKusReoKMF
	yZP4jfl6e2S+RG/P/JE0R2xfKRBLskX4iRc4GywP3a1zaD3S8VYrnr/YiBk923yU
	Snk0zTGuv2dVU1nUwUV89T6DtqnY58TXLkiGrWDgW+od5O3uvJHpxRqAOt9KQJDP
	CW4f9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm8ajg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:36:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so5132133eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386215; x=1794991015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=bZKIdUQrK+UAyPNLzL5I4Iw7Q0TZ31Q+0VsEmK65H9eI16NLb3JCf3yBrTqEnC+gKF
         PC5YW4nr2xtx42rUIvruqduNL9LgNkTfKDLdbGy7mAOl6OgyEZdTJ99Dj8pgMEOIgUDx
         /cevxc2L5+eTBPN6VieVKWXPc5Qh0K0HEYVETchtSzo7GzcZUtwWz9BvkV4EonJsgVfl
         A3l+WNIqckiEnuFIJING5ngg1MirhgEwhkAqYUhtYvdUUtPjxPnKorlQYM/mWQQy2tjG
         ZFUD8348s6xzC8+GLRZ5pmDQ2Iz79dDxJClNTfUSSuBgPlvnHQc0lfRfp22rz7VHnggw
         Qz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386215; x=1794991015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=GQBlHgEWfaT/DfatxO390UZ6Ou3Xs2RV/ZZeI8n6FPnLdmpoyfy8CKwVrP3nAzgHf5
         F5GIFWOMEUG6jpzLeNUpuo9QZQBuL6a9F+6Ty8YAeJjPbCQAIr0LuFuJYnEJaRDcs0F9
         SCZdtKEaUqTry+/tcxP4jhzDHuSqF1vnjgU83yuunGnXakoKIuyDnggJqMZ2Djy6QEBb
         GDPD6g0J8KMBveOgeHnCQoywEawXn7bnR+2B+3n6Ukn96c6y2S/WB9gliCUrh1GXuMvf
         6iw2d582pD/xbm/4ltg4hYtn+e/lwuhyeJjP/82HoJSuFEta4K+FNIpPApKXFvlAtAwt
         chiQ==
X-Forwarded-Encrypted: i=1; AL+hErGyDKtrbGGFLHtPjSdmANUc7bq5jlgXCZq75kXK7yex4pSJ8RGKLsCpAHg86HkoWij1TTHIqIU6B2wQtBR8@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZsUalmyMP3W3vfBZyUenDndGarxJrp/KYNDCbBHLPwuqu+8v+
	fEIuQ4Rv+KwSu/cy4zpGuEnFam4L2x7NU690yD9YLdSlNv6DkUxWFmRIul1hzDItDHig2IXHCWq
	F9Se0mK9fw4FX7LFmzAWlMGI3p3rvWAtq0kYu1Vzd13BM7Pny4C2fGF/nGTx4SOWAtbqK
X-Gm-Gg: AYBFou3GpbF2MzR8+/Nc6cOaUUUNpUzv9W47tJcf8xgGI1ghyL34T8XagY3KabISvzw
	hxABG7GzAcOaZt95/2bYQvsSXQwOVQweZ0mv3kFyX3jrvjI14yfbpCDrnZ0vxFwYDGZ2zYZ8Jr+
	ao9HbZqtETYV+GFxkHzXeMBTvCR/tMtfoiyA/A28rEA5dB+7rb4jlkz5qKSUMn3vsjqhzgRwhrN
	vMNFLLouLSYbYtDjG5n9l/2TwJCHDq/xlEvsiGFodQjf6mqU9PQAs1IVnLBktJeeYXYiRP1fftj
	vKwY/c6zF1Dxw64p6t/VR9RGJP6FMZDURnF3qSsR4m3/WCCj+YYQW9X1ThJej7tLw/TvTFcj4yv
	UjvV7h6yJ6mlz0WKR5ffQvOKFYiyP4+UfO+qJwwcabh5WyVhRYVOXDK7Gkj8TDcr+by0CGL9QTz
	Lw0lQ=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370134eec.5.1794386215102;
        Wed, 11 Nov 2026 00:36:55 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370118eec.5.1794386214630;
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14498936eec.7.2026.11.11.00.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Message-ID: <a723688d-5a23-4ab5-8cee-bd4b6dfd8aa8@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:06:51 +0530
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
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
 <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ucYNrdtxEXqwZ5XdKnY5WRLsdw56QfZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXwmYjn4AW9BpT
 qlg0HL46mRWqpLRI1TVPR3qPFUH7QCI4qxQFSs61CSyZ6etdnbKFNcjuVXKxbirRfwRNBvyk4wG
 NTdEXsNQFWIt29ekH3XbShXihTwIBQIvRM5kHm843V0r03XQp/XRdyCfxfps6S9L3H+sHRtp3Eo
 0dMuiZ0iJvCwyT1AbCL7RhuknoMYc2MEB0sVhB6fMHwrcDA4XCeG2a39veKICUa66611j5SbxJ2
 wYhKg9xoxMOLvgLE5DCElix8Eyg2vaWAv2BbBJ538J7icz+fnr+omnweucizuYEi/l4Mslu9a+c
 oAJIkejsiyeBv/duSIDZjzZDQrSpMSIgHq6XAOy2fGulAbWTNHGtloYhD4ISSmZIY4al26KWBhv
 dUGWZx0GDKjbFYwsNOD89O2kQsgC8EbXlQkpJQnoEa4L2SCd7MOlNZA36geK69nsYRF/C36oTXi
 m5Xn9fbDobF5NpqMS2g==
X-Proofpoint-ORIG-GUID: ucYNrdtxEXqwZ5XdKnY5WRLsdw56QfZw
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af42927 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qPl2DjZev0XnbMKBJ24A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX6QeHiIfRdiDE
 wPrXayC8CVLnCvBX/+N59azslNdcQJXeUCAYp1UgfgpBx2CBCqiWiGQwSHPmjO1ruexqEf9Umio
 KVFmWOzTUDGgbDm++l2xzPcK7r/Vx0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 03-11-2026 19:49, Daniel Pereira wrote:
> On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
> Hi Ekansh,
> 
> The document reads well. I only have a few wording and consistency nits:
> 
>> +The driver binds to the device-tree nodes described by
> 
> The kernel documentation spells it "devicetree" (no hyphen). The same
> applies to the other "device-tree" occurrences in the file.
> 
>> +4. **Context banks** (``qda_cb``): creates a platform device for each
>> ...
>> + They are created before the accel device is registered
> 
> "They" is ambiguous here (the platform devices or the context banks).
> Consider naming the subject.
Thanks, will fix these.

> 
> Thanks,
> Daniel

