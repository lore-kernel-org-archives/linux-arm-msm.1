Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297644685D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513890; cv=none; b=Ul73KKhhGi2GopwuJkazBImHjhr15LjHwJHWMnx0LvXAlumo+AASdYYSfzQqYLmF3+DZ2TNs9freHXC6T6PQKAxdNntaE5EhrbBk620YUv+R1C9EHK/JgdX5nEZL+LZZci7Jees76TKeoGN8vWl3VQPi08D6yuhlmXmBdSZ71FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513890; c=relaxed/simple;
	bh=+rl9fQr9azEqUQ3Fd2v2gvsx2XP2rBcE+78I6PeARIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4oyNJPZsZ0GbHHiLhjf85iH9ikKGjn014juMX+nJ5M+NTfSketyziC3puJatgDQvNREZw38yukj/wV8rRSIC+DgFYHvazIO4FPhjg9/8C5f8+aJlVeCEtRQ+OVedF6vM4gvcIEh5hsyPBg32ianu1KtnZCiE1LCnj5tIAJdKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoFWnwrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHWK8UzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoFWnwrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHWK8UzG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847me0F3234519
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 09:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FtMGmmAUhcPYjRJ8a2QKAQG+cJan4crC2OeXEZcwHY=; b=OoFWnwrp9THc95aV
	vaykirE2cuhR6hNv+Mj9cLD0w5YIoVokqDB0x+SHDr1PqOuHDDhdgfk+W2KjrkmG
	PV80+Xxw5HWFEcjDqFzYPZLwmWcATFjxrj/Lz/pichhWNBJVf2XCvJs00PuwEcRd
	VAi8SBKzNzAqBDYpGqAM24TENgtWIW1sJNCfKknr4y701vwtrox8JS+nHmm1Q/Bk
	PrrY0OR6N6SeMi7CTmicjHA8a86SGr+fDiBlvA3ygQHjH8AYO6431nn1AQn58VdL
	WUYjKVz2DSlYspWel8E0Y+3IUwMXYQ5t+O/ZUjV+TQseJRLgp4aF66uYK3MWRfZ/
	iqIuzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r12ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 09:24:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso14246985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788513886; x=1789118686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FtMGmmAUhcPYjRJ8a2QKAQG+cJan4crC2OeXEZcwHY=;
        b=QHWK8UzGPKx/+4m6eM213voWWG5IVFrs84r59I1klcYxSf7J8C2MP3ArWbXXz8VwFz
         D8LPJ8xHDS4829jjy7/gdArd6dKkx5SBd5oHO4JLTsaujgfe1WIxyqSmAw5VsH6ycblq
         RZRmQTGI0RhZSDnkjvesT3c/YTgaSm/D+cltLIfddVR1dG9of8EJtCXCxeHYvWuq+6pE
         pKzhn/R8p4UEmD2WTgnpy2T/2HXROS/KUWlm14EOnoIgUaQi2N1Ryc8aIpjb4WzIEab/
         4A7rghKzYTRLfJyXU/nnfEIh+tCDO1xaDHgPgrrWJWumjWqNIX+YZRoNV4TE+H6UXy0h
         8SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513886; x=1789118686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FtMGmmAUhcPYjRJ8a2QKAQG+cJan4crC2OeXEZcwHY=;
        b=ivZqF2WqgvQ2wjSNhyOwMweLcHpVTIE2U5tFtn7yLdLb+ItWeJupDthhHwP74z6x8F
         pAw8l9KWLPo/fshd4KAJskeb3oTl7TOmhwNYxW/vs1RCI2kd7fnv/Dnp/p+S4Ryz4d0E
         KJ6NcyoDfVbStKsYOIDeSf6cxTFvdCh3DjwJ+yHcRXZlCO5z75Y88iA1Xlsgj8tpuOnh
         ppFac0u/BLj1AgL6cSPanOIznrBJ5yk88bwNvdVnXGBrv3XuWcHUPCMA2MKyoIuxpEpm
         1mKPHJz/GU2dQWrBMrhL956sNlYYNjS5XB5j6kLKkbvP4D9xAN8W7mBIBskAh5kntCny
         SbWA==
X-Gm-Message-State: AFuF++mzYAQdpfzA8+AQT1JpRyvni68NG55y6zJ4icjHHBQc9jAlZbVR
	5hb48cyjeGj9zPcIJTNPH5B6V144kxPZMWQsWVcW0kqjlUwMc/fPp+ejWylzK4an8cCumNewEgM
	/l6KtsC+sx9o1SwGq6zTS6L6tnuyGPx13NkStFGdq9uhtFhSuIk0cfnEt+f4dTRwjjPCzXVCtcC
	W1
X-Gm-Gg: AYBFou2YbkTPgHlFaKeY1C4SYb8aortC8ciF2G6WN+aaVfzl2mK7Z6WPcJ4kVrXrYkk
	DKnfs6SHWHtTpQzOXfmstfFTwd1R6fn/0TCkzVwLLQ/Vtg5qTZ6Fi/7V4hTv7xY/GH5lFMJltTy
	XNz1HRtpFiL0zwzvvqENJjNiEy1GQ0YGgaUel8/cXAc6KAEejF34Ftztvtw+URkxQkhN5xzgGl6
	e9/DBxlTMKe8TzGJDT7+VhVTxhjfmAV1c94vlTlsoTbKMnTAN4cgup9x79Dv9nseTUqtgMIsV2Y
	T/LF/ku7kdGbXM9LkhbZrW27IMhVVIoHzM9Z8nVFptYLcV8JVYgwpoqYD0eDq3SnEX/X2ZaINtX
	6Pu8Bc2jkYwGVqzvstTLloQ==
X-Received: by 2002:a05:620a:a0d3:10b0:939:8148:1e3d with SMTP id af79cd13be357-939814821e9mr181783785a.2.1788513886493;
        Fri, 04 Sep 2026 02:24:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d3:10b0:939:8148:1e3d with SMTP id af79cd13be357-939814821e9mr181782985a.2.1788513886047;
        Fri, 04 Sep 2026 02:24:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm83344166b.23.2026.09.04.02.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:24:45 -0700 (PDT)
Message-ID: <29755612-0ddd-4447-9859-ae781e8b3c5e@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tty: serial: qcom_geni: don't ida_free() the console
 port line
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v2-1-0e83d8df410c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-topic-sm8x50-upstream-tty-serial-geni-fix-ida-free-v2-1-0e83d8df410c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfX1ask7fCo2G6b
 9zm2Yg87KAqphaghLB4RqkAJiHRWW3g1pqnlxKV5kn4H97ymZMK3Rh0ql+ILdeMpfSxY0cP4J24
 PVSJ7eqGGqwyLhcfWkDFOMUfd+jjf10=
X-Proofpoint-ORIG-GUID: S4w0IIJn-jgYsFQic5HOMOd4QED98PiY
X-Proofpoint-GUID: S4w0IIJn-jgYsFQic5HOMOd4QED98PiY
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a8e5f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=DqZwqz_RRVBYWPiTFsgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfXx1CzMd/X+fq2
 e3NhtLfqzkKeZCRn+FRWlgSgNhqKEYP4zJneK0HG/Jbdrnld08GukmuPovWD9kKaNRTKVCy5YlC
 gTsqBITEw9fGFgxRcyY7AMz9oZx4jqTsaXKo4RFCMMlDofPVlDJiXgFOi+QkQhNHJUfz7fBF9b3
 v5lV6/UA6c+JeDfX9KROTPJGh673zqBAkg5fJ8y++BAdJ3fiXZzmOGjrLHQA8Y5rAZTVMrjy3oh
 eNhyLUGkJAO+C/QsoJgvhRkt/jL5YchfZZrQmpKm7bTUQofNCcL3D0wVEdJ4CixMxUTfFvlTDc1
 thMMklNwUSFiT7MdxaxptBJ135RE14BahBfljNz5RFres019sDIHlboRV1mzaKjUDSNN0+H81+1
 dyy3Pn7jeEC4K31SCd6LSAUZd8FiqJBfEwrcbU2kza3w4pfKmgBncr6EwMvJQGNE3phgNj9qfa0
 eiT3B1UKVLVFgT3ex1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040085

On 9/4/26 10:50 AM, Neil Armstrong wrote:
> The console port (qcom_geni_console_port) is a static instance whose
> uport.line is hardcoded to 0 and is never allocated from port_ida.
> Only the non-console path in get_port_from_line() calls ida_alloc_range().
> 
> Fix the qcom_geni_serial_remove() and the matching probe() error path
> so unbinding the console device doesn't hit:
> 
>   WARNING: ida_free called for id=0 which is not allocated
>   <snip>
>   qcom_geni_serial_remove+0x58/0x80
> 
> Fixes: a53be6945f51 ("serial: qcom-geni: Remove alias dependency from qcom serial driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

The robot continues not to find all the issues during the first round..

tldr: uart_console() is only a valid check if a port is an ACTIVE
console whereas we skip ida_alloc for ANY console ports, so in .remove()
the check should also be for device_data->console


 Medium: The remove-path condition remains incorrect for an inactive GENI console port.  
Patch line 326 changes the free guard to !uart_console(uport). uart_console() is true only when uport->cons->index == uport->line (include/linux/serial_core.h:24-25), rather than when the port is the statically allocated console device. If qcom,geni-debug-uart probes but is not selected as the active ttyMSM system console, cons_ops.index remains -1 (drivers/tty/serial/qcom_geni_serial.c:1746-1757), so uart_console(uport) is false. Removal then still calls ida_free(&port_ida, 0) even though get_port_from_line(..., true, ...) never allocated an IDA entry (drivers/tty/serial/qcom_geni_serial.c:279-310).
Use the same ownership predicate as the probe error path:
if (!port->dev_data->console)
    ida_free(&port_ida, uport->line);
This makes freeing depend on whether the line was allocated, not on current console activation.

Konrad
