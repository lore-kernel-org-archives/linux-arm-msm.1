Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946950;
	b=PIMv/qSXbS0O2thcekRtaB95kd4jY/W2Hw0Tj10ANO0xc2p447wPM/FcySqZ10kaX07l
	 Sw3ph4p/tBNt02EIMSnrTlul/2IAT3l/pZgysfAvUQBquiaoCwEUCeIayl5/QTwkgWIkF
	 DsCgGMvne866jUgISXTdTcce42YP9eRuphfszHdak0G+6smNgTst/K+pRkeHBQO8qqA6e
	 yodKQuLg0Y3pDUQ+X0MqwA0EiKJ5mH1VwshOuHqh0mIEqiyqJcup3s+F17k+rCmbcJDFK
	 NZSoN4fU+34znrcbzPgUgagFS5p8TuXVIcLpZ0ihJ+/mWUhrRJmQ0ag+kXP1Bl+Pipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
	b=1VR/qe+AUDUOWt78gj1a2fGxIwcXGa5e0+3vAydodeK+r0Q6EjwGLi1bYzry7FnaSt75
	 u/lESbzjQ9bgDvPF+0by/7sqFZ1MDZnQSinQkZGZVvzVDjzy9+b6FR5Qx9gWRSJTNk+Cc
	 VM6Dhp2KkuFmVxdMzkjXR0jebe7SAECUXdaE5wSJXEp7Hfn/tLN8/TTCRylGHMYuSt9+N
	 NxPqdFHb7zxkYe4ETEASWItlkQzqIC+W/2cXhV5KHraaG0y3If30pvYE0JpZg4TCSRjE7
	 tDHv2tejxtGihliE9KAbQ6AvamK8Tfgm8PBKbG8CruG+o0sB6niBrXOOc1eFapdhjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gsAeyLH4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO6cRFze;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521FF606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 06:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gsAeyLH4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YO6cRFze
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xwx03856541
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 06:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=; b=gsAeyLH43045rcAh
	2/hFbqSuIuICOl92IQYvd/0DQZRJDqn0TeVKRDm9eVnQYXxjtE3xyTcSqgDFCz3R
	S455QSbL7DivsWLSuf1zrXtcTjFDSuDhwaSuReQJjLdgIxfhHK+sEfq0wtBs/xSm
	8XAjjClQUEkWBq8hC7avhaIKVpWA9yjPcvJ/81VS/B9sztQ0iBb716NcNqmXcZM+
	be//wcYJ/bG4I7idm/K9FriKTITnpm+Zz4Wb6GQB0t3RgeV6+/axtNtKkAuVc+r7
	frJSVn+hgcMAb6xI1JetNlCZJgn1CYpKBbq8PuFpb5Itrg0Rwbu4YZSTNG+muJKA
	LCQWjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sd3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:35:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so4162695ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793946948; x=1794551748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
        b=YO6cRFzeorDgOYsZEc0kIF5pDxse5ZSNIYTI7KEjWmS68WOy6h5sP/3Kuowhf257G4
         GfIHbp9dgcclCJjlkgS3l5Irf3CK9e9igFftEDcf8TtjxiCwQojU+GFcUJosGZzkVY9S
         l03MmAdg7jWQle58+mha0G87C04h+Yyngsz6FfjZuw7lwH/2HVJhh82BBYNAX9qpuBa9
         NNE3dmiD9loPyl8veg9v5DBmpDfJEGrr/KwIle5IotK4jH8KuHyfuM2/vAn9owh882Rs
         CFDV5YZoV6gNGVNuSWXmJnImxgX111i0Z4nWfQA7eJL4qBIJJxUs2kPJaVZDuUEE+WLs
         bbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946948; x=1794551748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+/i/L1YsccLk7h47H4OBMl/+UTR642ye1G9gviqzEo=;
        b=P3uVI90cPIOYOmqplK62Y9/X0Sptvh0A0EEWRuMb9pk/SU3n1KJGRzmBAplPbdloqk
         mfUtKdx+qY1UQpZPWMakzMnpuaDtuOh38MPbdVRD55WD3pO5pAVY9fv29FTSp55dQigV
         BX0RslfmNqWC2+dD0MNoKO5qFMQ2Q0otRxDip95qbrAvi+9LxjqL8GbyTTTdLZyqZAOO
         4oT8yb5GE7rI2PUxX6yYe7AFxVzTgMq+nVV9bVatY2hdh1alA+5Q6x4D/oOuWuC05Chg
         ytTyBhAGWVicCGphK0p1EXPX7nZCjO8jZzbfUYJEiL50U4AZwsEtl9nw7mMGlIlqKnBE
         0tSA==
X-Forwarded-Encrypted: i=1; AL+hErHarKRdjosy3PgmLCICSRpE7rzEJZ8BTt4JRy53tGS8/AFlZaMWJZxdSw2/Z6nlDPukVZ0nMgrBBckEtM82@vger.kernel.org
X-Gm-Message-State: APuU4Z9U51jV0CB1RUTCtVP8YY7WtUT3E++1KT7We4Uk4IpXAMQQIgm3
	TVwCWPfhhctqXcjjRyIs+2yBaKQduwz5ia6yTGU2I5nE1VgMhRtXUDs1OtntZmMB2w17ePQk+vc
	mK7BTKWxcZulULAzzOgTsqVQ/9z1doH89HBHCd0kXcS741va3aY2B0w+PO0N20ZYnwHT9
X-Gm-Gg: AYBFou3O8mli1Ai9cTjw97ft22zUB1381brihfz8TYglSN9Zerf4uY0RJbe58qs+tLV
	TjYkdK0fSvqeFZGbARj95TXzvHxjJLdOEIpWqIrwI9wBSw2hoVWxbnKhknL7kkDO5JEDWT/WXGS
	JHLhlYF+N1n6lGX7GMnHnsuITt0HAu4wWM2fRO3CKta/zd76mooYaofTG/sSsFdVLvAidTb1/mN
	knvApnKZma1Dl5CowLaIGT8ctJCUYKx0EnXLK2OaYIZc8hZfTjp/K/v+6bMmnZfc6Ky59HL+IhD
	zbrgzWZaeMKlETyOS9xo7UuygIoeSzZwNDstfQkKUVjhCqietYa4LRPTPE3rteb1mVzt74exhW7
	P2XuHxYHKOQP+0iDm0zjmomNb1HALDQDLYuQgLQ0bsVlqI0UsdU+CmygTjRhFfZ/JrxkdSKJ14L
	Q=
X-Received: by 2002:a17:903:f8b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ed40ad5971mr20472705ad.30.1793946947709;
        Thu, 05 Nov 2026 22:35:47 -0800 (PST)
X-Received: by 2002:a17:903:f8b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ed40ad5971mr20472565ad.30.1793946947269;
        Thu, 05 Nov 2026 22:35:47 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40998sm2193875ad.34.2026.11.05.22.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:35:46 -0800 (PST)
Message-ID: <561c0f8c-3252-4802-9d2c-ca1f93c65247@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:35:25 +0800
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
Subject: Re: [PATCH v3 0/2] Bluetooth: hci_qca: Reopen port after power on for
 QCA2066
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261028111839.2148515-1-shuai.zhang@oss.qualcomm.com>
 <ygy2hd47c3tb4vr2joiiy4bbg7rd4pn66x3co7iifv65cvnrf7@g36i65agh6p3>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <ygy2hd47c3tb4vr2joiiy4bbg7rd4pn66x3co7iifv65cvnrf7@g36i65agh6p3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNiBTYWx0ZWRfX+ImC5dUwBdU0
 RvjHheRJKbKLoXL5dmqbTrfcnrBEINeKTdOJSANuFgiEBJaJhEgxNjW5BxCtGoXi4Nyz9ERacW2
 viEHSuWT040V5FB2N0vOO9PBBYaMHpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNiBTYWx0ZWRfX7soqLTom0+0i
 aRVQCMXO7K7SFrSTrKmHwM28sj1/F271VsTtL+ha0PHtAjSIGq8dIEngHCEfPZuWqyuMd2OliSi
 m4Ud1IcZb0YcY7jnLFPqh+4BNkI9JXuVSkvsFG4jeY3rY7rkMziV7ZF0ULeEL/4x7oyXolRmBJs
 Np/nHDpeaBuU7Hd49zuJd9+CipS1GafXZ6iQRWMQYQf/1BWC6XppjoWMeHmrjEMfHsGP8h9IsLI
 WXEiOAVU8acdr4+E7uyxzce+DzG7m+O2ZghsS0ABCtH5mKSGLDBMvlIZxqYrkA13Q7F9GngD5BU
 ww6BJ21opUY5R4jXotEN2VyCPy8JAJbB8my9pOxhZ/tvpwzE4agJh0NCP8wWc7Vutydj+Iiuezo
 peTBv6L0zhu1YM9GrcfvqZoNxzL+1qb1oRsJk3reA4LQlwSSEJZMLZY7njtgURB1wYFGvI/Kcjp
 OjWdkC/BvwKLIBkqcAw==
X-Proofpoint-ORIG-GUID: C1zTo_zS59ObHEUFgK-Tu0JfX39Cy-XJ
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed7544 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=scBA0uvbmrWxsdo9N8MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C1zTo_zS59ObHEUFgK-Tu0JfX39Cy-XJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060026

Hi Bartosz

On 10/30/2026 5:29 PM, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 07:18:37PM +0800, Shuai Zhang wrote:
>> QCA2066 needs the serial port reopened after the controller is powered
>> on, otherwise the host and the controller run into RTS/CTS
>> synchronization issues.
>>
>> Patch 1 reopens the port in qca_power_on() for QCA2066, as in v2.
>>
>> Patch 2 keeps HCI_UART_PROTO_READY in sync with the port state, so that a
>> port which failed to reopen is not closed or flushed again.
>>
>> Changes in v3:
>>   - Patch 1 is unchanged from v2.
>>   - Add patch 2. If serdev_device_open() fails during the reopen, the
>>     port stays closed but HCI_UART_PROTO_READY stays set, so the later
>>     serdev_device_close() and hci_uart_flush() use a closed port. Keep
>>     the flag in sync with the port state and skip the port flush when
>>     the port is not open.
>>   - Link to v2:
>>     https://lore.kernel.org/all/20261016022302.4003647-1-shuai.zhang@oss.qualcomm.com/
>>
>> Changes in v2:
>>   - Use a separate case for clearer logic.
>>   - Link to v1:
>>     https://lore.kernel.org/all/20261015092224.262158-1-shuai.zhang@oss.qualcomm.com/
>>
>> Shuai Zhang (2):
>>    Bluetooth: hci_qca: Reopen port after power on for QCA2066
>>    Bluetooth: hci_qca: Don't use the serdev port after a failed reopen
>>
>>   drivers/bluetooth/hci_qca.c    | 46 +++++++++++++++++++++++++++++-----
>>   drivers/bluetooth/hci_serdev.c |  6 +++--
>>   2 files changed, 44 insertions(+), 8 deletions(-)
>>
>> -- 
>> 2.34.1
>>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Just want to confirm if there's anything else I need to do before 
applying it.


Thanks,

Shuai


