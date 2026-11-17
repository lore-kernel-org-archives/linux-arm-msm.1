Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936523;
	b=Dv9e1OOVzW4b5YrplJ1nq2e5QfnyUF228HK3mvOM01XDuuX1raDF53sBlHvdeizfJGEq
	 JgAiTwQSd2YggQqFWiMCuLUobG3KhHMY/fcEmWqK/n1R59iy3UBBqSP8D1bK6Y9D6KCmb
	 VRcdIQlvWEqSHShc10ZxOC8+txQJ5vaeknhLn2uFBng0ON5nYHSVmHQbUF8lI92133cM+
	 jmj89skhg29vFkM0WlQ9rk5Bf064gJ7TDf+9CRLiqZSZRU52zhco3q/a9GenqUiQOKfVS
	 sGqf1hQOTyzpYQLp9+9KlKTvl+FU90e4mv+FFxZ7RHmY8+S6KyB4kaEtLmWBWe6CD0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
	b=VkZYzFK7DK3ik3zk1UlcO+HXAFt9K4iNref+lZVUufjm9CFwyp79dIfoJUtObPKNLQMI
	 NcXHPhRRx1jxwJaVc5QG+Aa+y0MQO5CMSlDwBbyjhM18fKwCiVG2ogwwdfkxCkmuwEs3N
	 3STAF0T+KVuObiy7x7CIqIVuvbonvmq0cky1jtXwBxoio9D7laFOuVz8bD0K078rL+bHo
	 G4FHRSOYd9bggTAeODmqVk4OhTFFAM10S6Bj2kkKWoqrQcr3Y0RHOrroRA/ERFBtUgf42
	 uvR8F7+rjxwI6RIva/ZUJuDSDPTNrG3cu2pO/5T7No+yN6LmlUpHKP2kzGUE0uUXblg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLWtSpQt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0931606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0931606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLWtSpQt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQNQW1141623
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=; b=HJnEhgb2bdQlZQjE
	Kj3chHu8kiRM9GDtJyJ5j9eKdiU34ayyp8yocjjJ7NzMEMGXXjAHYO80adE+dv9l
	IwJTnWmRmS3mqivaKRAv9BWXSSNRwn0Eci4Zw6+gFmIn1QNGapJWYw1ipIMM0yPw
	5VI1WASclYFa/UEoqv/95IlFHkMNgNduE46RommRNzv++Bb0JHJm8tTK+i+5VjlG
	l1OZ5l9tfLTzX6DMAzKpXp3SRPqmjcDZqfU7P6Fj4FAavzqznt9ERRV7m7wCH2a7
	ZaARfp83EReIFAkOvHx9FYGgaBTdXWf/HkRLwcrdjsnoFJfmNYWzS0BTL5WYs3OK
	EmOlfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t0nju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so102300eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794936521; x=1795541321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=ZLWtSpQt2IQaOyLYJvegt4k2ygfrcYExvUkysnEDZSeYgg56n94jPU5JiKp8OHdBcp
         HoOh4UqxKGlQeyej1KZ6cvCp51YrbDD9RFSzPVHV7dQh9wVjO4rutRA886Tcu16Tn0Pm
         oKBYiLkjPmorsrrwR6OdmWI+t1H8NdWF1xXCk5YL6sVaIqdgeI63ZhBnmubPsYPEL9tM
         Rbqg8RldzvniTCug7x2r89EjfjFlla7KaxfC1N5Y2kP0Lc+NRt8Q9/S76zstVfRs6fx4
         hnvhXcjI31fOsFtXofcl8mdVnnqakEVWnUPb/ghLU1vYLnla2JK00oBu0by8Kyn0hbWu
         xTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936521; x=1795541321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=UK5Iyo+UN6sEmPP4eLQR9uNjXW2Rkgxv1s0Rf7M00W8aA2UiwonJ55EXAL5vQUhSDF
         BZFjCrqDO4RsIC3GdggXFlUGVHHVit/9K5GZa9M+T8zzc8iEdFGaex9366BC28Fna9q1
         VywQFkYbytXAOOFSneOuwJ1FOmorY3/CFkKZAq9dOFjXSbMLePIhEVz3IHeV1Z1oeZan
         8zQxD3bbRv1NmuotQY8zPov65yjCWqoY++gkVBbgTz+NfW4BUzhnqfJX8rjv1Qj2rNEV
         RiZMUq5O0GoAGMYZq4Xo7+yAJJO9XkLeuDsmnpUaxWQmOYzEUmJozqO6IliRw9JmJoYO
         ofDA==
X-Forwarded-Encrypted: i=1; AL+hErFDfL3A2EZL6ckiNchh++s4XL8ImF3UrTh/ah7IEvJu79/xoBU2Ack+zmr2dXfbJ+1QN17MgxBxPqo8Cw1s@vger.kernel.org
X-Gm-Message-State: APuU4Z/APOppmITMvZB5TBEqH2vkLTTZXPOQQF3wXOUerLYYsXTSIoSB
	uPg5kYttFrubT640w0sGKDlRFRS2yKsglLusoO6RQeknCFC8urTuzGn2FmWSoHmM6+o2nxgcQHT
	iKVP13ujTEN0iTbhsrX+lgWljWkUwUsghKNHcAHgNLGAgZpn/5yumtGvu9vJqOyoZL9rN
X-Gm-Gg: AYBFou3obODkMNwcRuoP9FSynabKu4fE0SszpLNXqFg5q8o6tjQNJRqaxZAcYVXEfWp
	OlGdjHlEhUhjhY4AlMjqpi47j0K1DrIqMNrsYPuwSHrOzJiRRcbTvo0ASsMQnxuG7lB26kJL42l
	Z3qQwo0r42xoU5YDERYGNlctlwdtZW2hrYeaqq1uqCABNMH3uucpKJhTkH+xtO1/60XH1RnJY0M
	jnmMXBiX9rAGIv5CfaXmQwtDHMUdPRkhr3CyfiAfdwFM9tPfG997cIi9NBFZeRSMEbLssfQ0Iui
	utubXlxDkhqPo6mqy28MhU5VOEo8bka1jkSUVXZnd0RTbsE2KfNLfTHD1diKHAqiJ9XEZRO6Pya
	5GUcQyiTFFssbkIG7VJS78F7Az9/xKAwMxVgoQK3sF+9Z6mzsGjva1vIoJ2iMLtaCHwMaBNEeDP
	m3iO1+9O3AcT91ZI8y
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93338eec.14.1794936521201;
        Tue, 17 Nov 2026 09:28:41 -0800 (PST)
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93316eec.14.1794936520694;
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm48943359eec.23.2026.11.17.09.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Message-ID: <1d294300-0077-426b-9bbf-35e42861236a@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:58:29 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
 <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
 <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fd_NpnQ9J-a6EtZw3CgVK_Wq919TWtdf
X-Proofpoint-GUID: Fd_NpnQ9J-a6EtZw3CgVK_Wq919TWtdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX30k4sNc1gO/d
 BTfT3ni/PPWbtTxzx/1YlKFvo9iIGMDN/mr6Gzn+VCI2uV3b9VWXc2ShN73nTJ5SYL+6bYWLGeG
 MCXOWtAdRmhcsniGHVwFz4peB8M+okgJaKx+4CyK9hZKdBj7eB9uCn7RSqk8lsJNhV/r8I7i49V
 CaiLU3trCBiXBAojalqts5+CTS4eNcHefKN+JtOIXNJMGzEXw2BqpM6wIyu+K4Klg4WyJ16QqzM
 8VWpRtv6tcN7TcBRVPPv+bt0D4yIJnUBwB3KDpU0mS8r9tNpGcrrzdSaI2u5wNSXeBRvmu+Xa9z
 3d094hkqY0Qpqp8z+gK2nh0GtccfZSrjEUHE8mAVYLDX/349JIqV9j4ykWGvpaxSiWuNMz2IyY/
 cBR/ea/4ydlU7x1H9dgd0cvb6r9gwTt115okNRX0ggKcUPQyV7Xq77q2q9UGSo/P0B3aXcZ+5Ta
 5jir2cVuaYFOwHh1Dpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX505m5bERBziD
 FssBvg1TbNY7NesGWyvnIh43wcfJSnugg7DyamC+mRBDJiwCtN/9eWDiu7/ALFiQjEzNSgS3TrM
 lHcQBkNuIUbt1R1JDYccoOoQcPj58XU=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afc8eca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=rBq-xhpCJJ2lye-X4V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170069



On 11/12/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:48, Jyothi Kumar Seerapu wrote:
>>
>> On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>>>> +static const char * const protocol_name[] = {
>>>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>>> Why are you creating holes in this array?
>>>> Hi Krzysztof,
>>>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>>>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>>>> 6–8 empty.
>>>> The added NULL check rejects these unused entries before accessing the
>>>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>>>> ID 6.
>>> And it should be 6. Just look at uses of this.
>> Hi Krzysztof,
>>
>> The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
>> This enum represents the serial engine's protocol IDs,
>> rather than consecutive indices for the name table.
>>
>> The SPI/QSPI driver uses this ID to request the appropriate firmware
>> and validate the protocol read from GENI_FW_REVISION_RO. The firmware
>> loader also matches this ID against the firmware header's protocol
>> field. Changing QSPI to 6 would make these checks expect a different
>> protocol ID.
> You miss the point. This is just a table for Linux driver, not what is
> programmed. So please explain me, if firmware comes with new protocol,
> e.g. OSPI with id 10000000, are you going to use that as an index?
> 
> Really, why are we discussing this?

GENI_SE_QSPI is also compared directly with the firmware header's
protocol field and GENI_FW_REVISION_RO, where QSPI is encoded as 9.
I therefore propose retaining 9 for those comparisons, without
using it as an array index.

Can I replace the sparse array with a switch-based helper that
returns the name for each supported protocol and rejects unknown
IDs. This avoids holes and remains independent of the numerical
protocol values.


> 
> Best regards,
> Krzysztof

