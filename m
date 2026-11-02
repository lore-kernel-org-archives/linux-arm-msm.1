Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614154;
	b=wo9wQnsqHgT4nPH9RntfKjIfBO03q6njNy2OF4tUIfPtv7LzjoOC+L9aaZYv4oDhy1xE
	 YiLWoetXwb95IBAPOpoCfS/R5x/YrPHoXTuYQbLlaFGKEfu2i1BLBG+4nhbhEXv7AtIZW
	 sLzyPPyMPt4+8AxdFP9X289709P0HpeoKXtJlCun5me71Py3fq90HQzEA13UnWGpu6l0l
	 bbChtzgRbfxLXTn1gD4enspJom2AtwFBAdputl5pJjyQdHyLoOs5efVorfV0cX6VPiv9U
	 otuwIpjw8U+B+jF7G6XIpufIgNIul4f4RqIkJLzjeyu0VP669klOyA79bBZcVnsTGzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
	b=U0shW3KgttnG2+GgPRlcJkeeB3X0+g7Yj1qHoSfm++XFIBK3KEE7I/S8/mUSos7FFvyX
	 eOYyjagtvhw/k5zq5cGeAMUsmrp1FnvKMPxnwc3ndwi50UwiHmXmgmtCQvF2V/qLmfaWp
	 N/qsglOSYqPFBiEreE1T06wc7610yEkoAaqU4+1dTumt4kxkq3V/0JfYa1t4HucwoaYDP
	 rgLcxda6i3pQwtrBZO8oq5yd6zPixMvQmOWhDl4gXb4IppBWbIo/bogUprMMaPdwqA4sI
	 irgMRIzHYisUIp3BhbLtHomMfUJuVUd7a3PyHdZWDD9CmavzdFdwwN1YmSZOl6U3zfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fcooxj1/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NpAs/XiK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1BB606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fcooxj1/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NpAs/XiK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A9EF3403350
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=; b=Fcooxj1/EnfnyTwT
	//vHKn83TDfpot7hVAY+bwYIcrYfAleant7bpT89zR1ne1GFlGdUmcQ1dE8WxGtT
	yzF+QX72fTvEX03D3r5nPmYKKOMLldpeuaD+NM6VM4G4VtMNQr5Ie5ZM/99IWOH+
	7WFnVcfA3cyDMmYaSHAMrpoGOHvzgoLxMCPFzRI+4VRJJ6FWqYVbS+K5q5iMLLWt
	irMjg9i5uOI80dz94zuM5alzkZfHUHBh2kCdG/G64IUiDN9v26DDI42eFU2j+l1V
	+sGC6c9/0ZEyDIFBsPgdz+wqferiq6K7sJ1W4NPtLQJDg3I0Q+OTwybI34zbJgRX
	4HGtIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8k9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:09:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2422806a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614153; x=1794218953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=NpAs/XiKl6lbjdDJWFdf5mIeq8d9kl0N94W9AOHOE8IxHcF5P0TJEQ7iaXQtgQtxp4
         vNZkq2oCJU/UzkKMz6aW4j0mvqV4O45UUWsKocASaMQrE6sWhDy9620DBiJt+FiGixrK
         U7JaNDm0uCSG1h7J0JQb/DBaiIZZw7ILffkhzBmFBxs1MAwR0FN+h59+5uNg7nmwKlIa
         aYD9cUOGqJzyjv1k9zHgVlxS+HFGrEoBbXFsyQllQLkbGKVStqwRe3SDXPZGoCuglsir
         INEZB3DN3W52DFrD6UjEKu6zuWsZYq/rA/q0U1z2CAIEv1vPF4Cq8xasGnZBOdIOtu9t
         OUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614153; x=1794218953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=2xlVkXDwUj/ZZ+15u9JtqlgyeQDPhU+l2No7cAV+5bv3lQ2RREwkF4GHuaZrIBT02r
         2IF2AtJrR2NbRaviczmmj0Y/nntl3ooo47U5/Qme4kbZZmcA1mhASHug+9Z3ltho0brY
         4Y7NqPeY3e3vpUjFLuEHciWnnPxxXDzTguK3McwIXVjUDK1fcoP3GQ6vSZYUkWRl7wZF
         bqkVFVn+jBFMxyrDo5m5kQHUWpB8pPVSZC9/c5VdSKMG5Qsl12EeI4M1OlJEWL+eh2tJ
         drzUU2Oh09soAy7Lvi9SGfMAMWVo+lZS2Killc/F72LOUBW9mbV+ytTbQh0HmMf8orDr
         UDIQ==
X-Forwarded-Encrypted: i=1; AKwUvByrQS6IsFWPwFIqpi9Qd2aV+50s/qNxl8sXgHWiFFX2gRFyHsnHHd9/IZpBOxfQ7LktUs8gGlF1Z2q+7PO1@vger.kernel.org
X-Gm-Message-State: APuU4Z9sVu9dSIqYoYRjsan3KW3aiBX7Rg83PfvgJ8c8xxUor8HKnioQ
	0mDNikKTNIHpEWutAUeUVO6aMzvHEO2d5sa6LkPOL9K/v7lf4Vb/C9IHfgr7Dye0Wh/c3JCich5
	8RuET0UqlwVjc5rR6CiDEfhdRqhQJbVIYie4VcOrYwYQWHYAeSB8fW7OaLFk8kAT11VKQ
X-Gm-Gg: AYBFou1x3STMsbMuKLVcQ/OmJIW2ouaOMJtbht2rCXj13uue3x2E/qvsV4bmbDvgENG
	8itKav3UbgRjz2X5RAUao0GresOMAP+SsaO3OU1aFpA67uLjxa6vEPwxL2Pgh8r5c6kI2wmLL5S
	rMEkHm4+Qzmvyc2xO60OQYXtMSWK1JLnrsXbtGwnnLPxYBOYdQoL1IKMLVwZRiGkXox5I8k+QRV
	QWGxlM+JGuzSzc1edldptpYgDxCC0DNUxF8VTnYnX9sX+S4RG/jDkX48SjHKIzk42hHJglRK3x3
	R5FXdvoy0fnW9jZdOrsUGC1BURfDVe1aAf2y+ucxKv4ouBFWdC8jA44pyJS3kE/8L03CPGS0D2W
	Pv7iu+PVYyh3tIbo7ZX7ZKiQqySRnrtBYN1Ec43+AP6hiWjlt3cMS6QeEtNj+txTl/G767u6+SB
	jVCA==
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207180a91.40.1793614152666;
        Mon, 02 Nov 2026 02:09:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207161a91.40.1793614151969;
        Mon, 02 Nov 2026 02:09:11 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm18169303a91.13.2026.11.02.02.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:09:10 -0800 (PST)
Message-ID: <26ca5c66-a2ff-4aaf-9c9d-724ac66480eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:38:58 +0530
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
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
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
 <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae86149 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=PkZpfZOK-p4hLHj_r-EA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX51wvUbi6R+0P
 7aF4c2IpmmY8jeV1DTMj1eIPKfJybijFmozwsb/tpg5n4z6bGvDp3v9ssnVEOJlYtzbrGzNl7vY
 W5kn+lCk4Xhuw0NaWWhJp8+GNQbzgmE84U270rPKMGWJ/EzOcjHYW28kVmzQvw0+SV0kkIWhXNK
 GVtiQivgq6njcRGHx0LgjwglblVfwIpTZtSL8fooR4OG9zfo7D5oeit/us4tnmLso7xYT/z68ZR
 K0sHITcGeqttudsGThqkEMTqoEsMZgbak9//zBM+goUnBYobpvs5CwfW/19+hE3WwNJXALbt6bV
 N62yN+ZUbZ9H1jx3Y4KhG2JPbWALr8Ijju6vaWZYyrBKsuUC3dvQ09Sh04fMjLdymUk9oYYjdP4
 FX4A7hSApgZDHgMatNMMsvfBlVxIr78aU2O66vnyBHdh0Vi21SKtB01od1e6akiuzH/jyl/ElCJ
 w/07Do9Hrd1luxdsviw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX2G+38e1ZFnEy
 c+CzZ8c97x1NNijsWlQ3TnF2wgBY9txSo1zHaookJAWmIoELdK+n5b9lIj8v/qKk1SRIFpVQ/jb
 qzwExgbOigXJUydFlK/ckECC1OUKZNo=
X-Proofpoint-ORIG-GUID: _QPOTOh47fE_dKwICdRS4eRKdV6ABgyY
X-Proofpoint-GUID: _QPOTOh47fE_dKwICdRS4eRKdV6ABgyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

On 02-11-2026 14:23, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  drivers/accel/qda/qda_soc.c            |   66 ++
>>  drivers/accel/qda/qda_soc.h            |   61 ++
>>  drivers/misc/Kconfig                   |    1 +
>>  include/uapi/drm/qda_accel.h           |  282 +++++++
>>  33 files changed, 5877 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
>> change-id: 20261102-v4-e8feb321263f
> 
> What is happening here? How are we supposed to work with this?
> 
> v1: 20260223-qda-firstpost-4ab05249e2cc
> v2: 20260519-qda-series-78c2bf0ed78b
> v2 again: 20260817-qda-v2-78e2d1f10529
> 
> And now completely different one?
> 
> This makes the change id completely unusable. b4 diff obviously does not
> work. Any tracking of this does not work.
> 
> NAK, really, I already complained internally months ago about such
> practice, so apparently not enough.
> 
> Best regards,
> Krzysztof

Sorry about this. I lost the original b4 branch and re-enrolled the
series for v4, which generated a new change-id. I should have carried
the existing one over.

I have restored the v3 change-id (20260817-qda-v2-78e2d1f10529) on the
branch, and it will stay fixed for all future revisions of this series.
v5 will use it.

Note that v4 is a substantial rework of v3 (the custom bus and iommu
patches are gone, the legacy shim is new and the series is reordered),
so a range-diff against v3 would be of limited use; the "Changes in v4"
section in the cover letter lists what changed and why.

//Ekansh
