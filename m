Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035829;
	b=NZnfS8LnT0i/81NIGcnK9pywYdJ46mUtWbPtEzxbwGQ/ezi7cJj+AylWvFs9h1SGnfUe
	 GBxkETVoMpSzq5pd4jyEB/Lnu5Kgx06gj0a1rZchgFu13+zdQan0rm05NbYZRiVVcWQG0
	 4xas0wznna3jBSg5SWM8mmPJDLRKvhMYIEpc3oXwcBs4oXjkZkSt6HB+cJznLfzya4ls1
	 zukuzASHErdtdbz7qFh3gFWm2FdceClJ7fdmA6A5qRYn1rsVoHZfckfAnI8YDcLsk9Jdl
	 a+YJ0JOwRwOSdK6HoaFSk0IhH6CiwnQkKt8U+bnpzjuSY35n8hfj5AOjkV+sR9xoPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
	b=4Jsap66vYnEFaQJobW5t7zmaRh2ZaqJT00eDwPIxqkjYy3qTIPy3R5KKH3Xk3qOevqpM
	 Ln106KiubHNU3tUvqSbqfaZX77A43K9DZVD63MCOO8pUDesMkxHJ+ZoGpVD6xNfaWQC98
	 JJWOjYZwP89xC2HH994m7h4yVhf27sVMR+81nBPnD8fnhzAuEvJ0LymkU7QKwHonX7/Rq
	 3Ap8W6WmGEAknPPkGc/P+EiwwrQbLk01ITQI7UauFtYeljh4A4FVwy0frdSs8EEIbFSSn
	 vKHP9l+tKx1Drwy5Kwua1p5f2WzRH1XGvYqePa3i5rHdqMFKCD209EQZN7kgfRM2Fzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KzLc+/lS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLux9zVO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9315606A326
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 07:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9315606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KzLc+/lS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLux9zVO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A75dvTm1411197
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 07:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=; b=KzLc+/lSWUml2+rq
	1WTkQVc68o845G87p69S4xaUjRpO+r5+o7abQJ3IfwsMjVW/6LVdPE/uuQ9kXOJu
	brCXuQSGQZla3DIBIFhTyhIQh/yjNGlNE0MWLxFYWvGWQgTRrqjbplineuKV8N4h
	PPSJv2r/iVs0gCB/B18vXxgAhamYJI4sq1zJkW7zpRT/JnitllGxSpvnLqYPxYcY
	YZC63inKp/dkWjsUUndk8S5MEl465qF9S2m2sTCKysK/uGRIU3pGCxy+RMtWaQLb
	gubgkPU2tuRrVFKjsR91iWkeQqH+9wKRyf5mKFSN/EEIICX6SE3orRL5oWvc/lwu
	ZioMzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvrera4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 07:17:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so333675a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794035827; x=1794640627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
        b=jLux9zVOryrvJOZl85pydAz6JQlnJ+7TlhoYL+7ples2OyQX5nCSqfTMfc8RLR6Ilt
         v3JDeVrSYqo9zASq92vV7iQpjucmBZ/1huqZm6Z5y0PZM4R6tTh6bLhPd1jWhkx3gyXe
         0UGxVJeS7FGPCFMXjKQFG7cDQUktM0HrOd+R3sjQjXCvQrj1wIktqC7acrH2KNp1LH7n
         fKqxdwOmEEeNQFJ9HasZoPHw7sj0HRaPVCdeNDKujicevkxRy5o9JjL+e38clx784Kja
         e24fHOCPstzvJmmR+JuxywuipAjscXMwM/iUUhCBoEYrp1d3eJgwSH0h/ftwEWJCHrpA
         QuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794035827; x=1794640627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
        b=cjNq8yfBtPF4gAbetvHKDIgwJ+F6BliLEZok8iKQiSw+ptbXVMbSeZqI1Q/vTKfaC6
         sJdSyzSv/7HVTxpF02cpTRjOfYfjssMgmQItAEsY8h1Rg9zueaY4495y5lKMSAhVyof/
         jTti0j62iWacBxti1DAqQl8AZDEj7Aq79PtsajIvxFpEoB06bzJgAqT3uT0dwssEfLrK
         51VOs8JF6ZOhLokl/WMynfeEokuNnDph+2d0XOfMbamJU0JadRCWyRd3SskGBjdyR19E
         4Hl+cpav8AwioHQ3L63tSWvTCjp7y0ejt2pFzP2aWCZQOxIzrbJQOIyoDJX8d2AUrHC5
         eayw==
X-Forwarded-Encrypted: i=1; AL+hErGhqyEZ5F0zdrjZ3rNhyoF79U+vOVxvJV1IRMcFPI17U92X3hrlqs3KT9Lf67VKCHvjQstqIabY3VtNXPVO@vger.kernel.org
X-Gm-Message-State: APuU4Z86Gh5mINWg91bEGD8/ffoepmj1ALCjJNgEBSCOMkXvpKcWIIFH
	t7WNd2LdwWA6Yol4ikaIpDVTYXjSDpeSjFK0KJPUtGebxJVJbwKpU1grqxKOsF6LAARYP6gFeNG
	xwTWBbwOxXexB/wHufljcUjOBk5DNno1D7f55ML8WH3ePQb075K1IObuEs8wyKV2bdlfW
X-Gm-Gg: AYBFou2UMCLbrW8S7pUzgV+p3UMopGK0cnFIxkCYU+hIVljMylLmpvHvRmUggEQgoPP
	EM0WhbKRQrpJbwCBVcuWxKnfuao4zI2kTVtto1wm3z0Ou5DDFhjZY+R/oTTEZVK91Ivn8EW3gWl
	4oc1EBdJC1p0EBcw/nWLiNXQjgpgJzLoJ2VRvgdeK0nKCQzztFo1drjHRUN1l8LAOb7Ib5BrNuJ
	FCptoTGHNdhxQNPsXwKIIqZYnz0L90yG7he3tB4ejry0HpeDjx0Y4mKRCmxtTLKZtTlCpc06QKW
	f7rVokp2BbDed4FNigpae0zYOC9cREBNqP8OlxgJTeOs2qcUpjNLp2t6oD14SELEMTFm6LheG+k
	5HNmEd9n2kSxIMVF7JOz2p84yTdu64bgEq7ZKgeVErDhWTiDkX/sSavh7GN2hZu8bNT1mCuZuHw
	w=
X-Received: by 2002:a17:90b:4c07:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1068bc47cmr1044932a91.43.1794035827114;
        Fri, 06 Nov 2026 23:17:07 -0800 (PST)
X-Received: by 2002:a17:90b:4c07:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1068bc47cmr1044923a91.43.1794035826641;
        Fri, 06 Nov 2026 23:17:06 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10588225asm2187339a91.8.2026.11.06.23.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:17:06 -0800 (PST)
Message-ID: <5637c611-69d9-4d16-b4c4-06fb794aecef@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 15:17:00 +0800
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
 <561c0f8c-3252-4802-9d2c-ca1f93c65247@oss.qualcomm.com>
 <62qrp73oyhaismnbnb7q57z2loovfpwsut4t4bwy6vda2vaewc@sbifauqgi4jx>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <62qrp73oyhaismnbnb7q57z2loovfpwsut4t4bwy6vda2vaewc@sbifauqgi4jx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAyOCBTYWx0ZWRfX6Z9qOpnJITgh
 uPxz59SiXhFyitYL1L584skohwBz8F0qKuOvciPWzILVMT7hXAcCAb5CsZGYMYGauDIuKVLhvaa
 L8fSAkKeVvGvHur1Rip2tKJNyh8szgw=
X-Proofpoint-GUID: FzJO9bQ63RMvwMs2uIcpaTvTMu7Cn_J7
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6aeed073 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9anGb3dB1dyhe_3J-4kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FzJO9bQ63RMvwMs2uIcpaTvTMu7Cn_J7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAyOCBTYWx0ZWRfX5bgg9c2S2izk
 2txz4q82omFJNOHmGcaJjsa8xrNkIjS3gxLvWPdt384nlXUk1PcbL9a8UTwgEYxxeZeRE2d2OFz
 H6BTRyxf0faUKkiZtwkICYuw6z1xD5BTadf7nTzzS5YwXVQ0I6OAk0Z65mRA1rkH1P3h1/J/kYY
 UgCd5ukMMf9TSPZju7vLldbZdb2MyuoLo5hIBSh9LdIXtzGUpH91aT8E5CkQ3GskEyncI/rIxuY
 JwBbWXrugIixQa0hQOJ2zRRTL6HE3h22O4VhSOGgW4q3VYj8g9oKcA+eOAQJeRWjBlm1hYFRWG3
 mbCjcYEFVPp4VRqi5vDVeoUa6rBIAISuuvrD3ia3ajRy3e5ZjWu0QGhhVFxnXQf4pYomVS4mDfK
 paJxn5WOP+WVUhh6eV4+yz4Bj2R1TCFAC+UWMi75Y0XvY1KqK6RkDcfzX4XTlRaHt9ch7tMOTdR
 sgoSj2Jh5Xi4oeJrZQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070028

Hi Bartosz

On 11/6/2026 5:17 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 06, 2026 at 02:35:25PM +0800, Shuai Zhang wrote:
>> Hi Bartosz
>>
>> On 10/30/2026 5:29 PM, Bartosz Golaszewski wrote:
>>> On Wed, Oct 28, 2026 at 07:18:37PM +0800, Shuai Zhang wrote:
>>>> QCA2066 needs the serial port reopened after the controller is powered
>>>> on, otherwise the host and the controller run into RTS/CTS
>>>> synchronization issues.
>>>>
>>>> Patch 1 reopens the port in qca_power_on() for QCA2066, as in v2.
>>>>
>>>> Patch 2 keeps HCI_UART_PROTO_READY in sync with the port state, so that a
>>>> port which failed to reopen is not closed or flushed again.
>>>>
>>>> Changes in v3:
>>>>    - Patch 1 is unchanged from v2.
>>>>    - Add patch 2. If serdev_device_open() fails during the reopen, the
>>>>      port stays closed but HCI_UART_PROTO_READY stays set, so the later
>>>>      serdev_device_close() and hci_uart_flush() use a closed port. Keep
>>>>      the flag in sync with the port state and skip the port flush when
>>>>      the port is not open.
>>>>    - Link to v2:
>>>>      https://lore.kernel.org/all/20261016022302.4003647-1-shuai.zhang@oss.qualcomm.com/
>>>>
>>>> Changes in v2:
>>>>    - Use a separate case for clearer logic.
>>>>    - Link to v1:
>>>>      https://lore.kernel.org/all/20261015092224.262158-1-shuai.zhang@oss.qualcomm.com/
>>>>
>>>> Shuai Zhang (2):
>>>>     Bluetooth: hci_qca: Reopen port after power on for QCA2066
>>>>     Bluetooth: hci_qca: Don't use the serdev port after a failed reopen
>>>>
>>>>    drivers/bluetooth/hci_qca.c    | 46 +++++++++++++++++++++++++++++-----
>>>>    drivers/bluetooth/hci_serdev.c |  6 +++--
>>>>    2 files changed, 44 insertions(+), 8 deletions(-)
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Just want to confirm if there's anything else I need to do before applying
>> it.
>>
> Luiz uses patchwork, I'm pretty sure the patch won't get lost.

Thanks for the clarification. We need to revise Patch 1 and will submit 
an updated version. Please hold off on merging it for now. Thanks!

> Bart


Shuai

