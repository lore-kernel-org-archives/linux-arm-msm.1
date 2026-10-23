Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749940;
	b=Uv+aYy5m222Bh3Upkte/beRl6xwcQ0qC3nEL1abWnZtxwWQCZvdVpOqs429mwWJF0QAC
	 78A8rlcNl+TCi6QAv4KaPgfK3Kmw3rjRy3RU6SXHBzSKgqZRYxiNeBp4RBf4gg9YkiS3M
	 YgYiX0SGcUmDFM3E3W47vdTBr1EHJrgBzF4M+y5ltsVK/RpF4I1yr9V22stFXXRcBpbFv
	 2f3NbHovWpOnTMnAkEL7rfGTvFcTj78rj+qNUV8c2mXrYBjXOsXy+5rrYhMKYXvV3ayIG
	 Ju98hj3Izp8pWyGHk8cks2TnJiy+Fon1C9mfsz2NjFEY8tejZzKzdDBEz8rizxCIh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
	b=QyeunYN8EaVio2ELUR7xNgymt8qYU5dwt3YCXtalolT2mBAVV/kdGy3jS1WaYg8dncA9
	 a/u0Jv+D0NEZHcV1OD6gzNMia9dzyar/mOMGgiNEnCdTEBbueSZGLy/QFUvVFS3lkVPUL
	 lPtOhaHyZ2scOLNoehy4B48ywBdIo2/hCGG/l1NL7jtlua71/BWLQZ2vbLXPIhW3SCpOd
	 cgwKrj9iOWioA/6itacOPcXxJ0ggH//VE3pDvX+Q1rHLlxtR5+VfnESGmEsIX+0udzO0d
	 LFWcNXt6/lGXRoJQnt4lfQFU2SxWfkBHFXpHrToQvH6HPFcXTzPD0n/FnyHml9dDjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1IitvQw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjvXfsqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566F606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5566F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1IitvQw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjvXfsqp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FEEA2068118
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=; b=e1IitvQwugHSTyFE
	Dm1H4kwMP7I7VgngRGtFJ1/5y1UgtiLBitdqqJjjfUVZAJVxahCNCQ61KI4n8QIq
	lurMPzcozAx6foaQeREbf2vNqWkJ4LLBfnlgITt3FuWwvrxGcnZ29KuFmgN86r/7
	IMEPg0OEGgjEafKdhOIfuGhEtvMKKHmC8yWIoFz6bTifa+vvHo+7Y7lXeqaoJQ0Q
	dLfOxUkKZ+MOR1sU+zn4Rt8uvWAP2s1rG6VBkaaozC1798bvzKniWTXU+UHPhHOR
	OinWOlNs1w4jYqG55QWo+78SiLbCrmZlfNf9Ntx2Rk+lAyI9Hj2It1ZwBv5RLaix
	3rdsbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw3mpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:05:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so11469285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749938; x=1793354738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
        b=MjvXfsqpsbXtqMqrfe37bK+0njcUZrPpuzZNaLhTyXHf3IMT2qQuybQZI+t7M/hkKs
         J8xNoJ/XcpSPzkddhkRtAMfkDEV11U0od5fUJSDJkrfaZ9VGo7kZbFeiFsytgGTMhgeU
         yn6Prp5SaQqiJaq7bZ5h6CRZAE6eIoFKW8ehDSM1lKbHzNxxnx303mRA3NLfEIZp2sca
         BR9L19Ti6CAAz5Hc84FCmrWrzUG3dLHHHtKtSKGMq9cKhHsbELDXFAQjxzDT52GLFdwv
         JE7wPE5XRgCvfU8lvcY6l6ojDhCIYQs4vo+sFLQgYNZ3KJZmYIWe4wY7CCVFcbAykxEs
         hybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749938; x=1793354738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
        b=N/UOyYqYi4ZVNkdRzptSTZjXgnVo+yBfqmwNmAZLERyAEP/AQz6O5Bh4Rr8AEbzkUB
         tvKfSYfQdjI6XGF3XedYSFbuJEfBEklvm5PAVXFq99w8WMlPSh7lzfnjT9u+OlVYpimD
         xk1SjePaQMTeRqHU/tg9trPQF7YOZPJ7iK025/KIp5MX2pEFrfzhkdKgP9wstN8zo5r5
         3jCyzaEH1450H3XilmjyteRuoTe+rmLlgWe6qCZkRgZTsx6npRU58Bbej909RpYpjrHX
         z8y+FEMEIBDqEgB+XDlheAJN/NsruwLBSyJvdAbQVUdCbBnjCiSxo/bZ62XdlWuCf36M
         JmHw==
X-Forwarded-Encrypted: i=1; AKwUvBxmV/BkL+GyS5ZXx0I/Sixy1XGCEPMlerCFUOoy3KYwu0nTcaEHGNvzodsTAC7yHQ2x4ZuCz9zyqTm+B4g7@vger.kernel.org
X-Gm-Message-State: AFq9FYItwTdy0Qwubvs7Tyf/tnRI8bDDyiSHYS4cwcTy5iekjp43QWJZ
	QbEUEDu+zTIojqIVqJyYjzMabEsBVPLMmvwYWBeDP06Wahect/imCyrpPniaXbBKETdvgW1nwrA
	Fo25kdRGXv48bKGv6ryGiN8hOStQQxXBmykMgVvar6f4nEQNLvNKKZ6irYdQ7jAHoROSP
X-Gm-Gg: AYBFou36QfbogvAr3gvjijKR//b/BAcr69zuUCj2nx+vHTnEyvlFv8Eblm1s/HrB2f9
	W3ms9+cuAQ2e2qg7ZVfLHj0xD6F5Pn5HVerEhgTWUNXOvxIPz+xc0xvaueyXrD8Hk00BNG/NNaO
	pKaovdL77lZFlQLXEQszATk8GIwTIJ+WtNE6nYEJNY1d86Hw6SlHfYOYbheC8E2B4T7FEomons6
	Z6mY+fN159UfEite/skSSRzCUTrM7QvMbcuxNOATSskg23ksImeYPAj48Dx67koWeWmlPsh4H08
	nPCc0wNzc34mN39dSTWIv3KOeQ1jfQ98Xjv+WEKhnhTwhcPCMkcnabn5lNTpx29pUkCMXrfROUI
	uoNj4NJnI9lzcJxilu5Z8vA==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr327423285a.2.1792749938592;
        Fri, 23 Oct 2026 03:05:38 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr327418185a.2.1792749937962;
        Fri, 23 Oct 2026 03:05:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d0d6sm85262566b.29.2026.10.23.03.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:05:37 -0700 (PDT)
Message-ID: <43ca74be-942c-4b52-a87d-1bf13d5dea6e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:34 +0200
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
Subject: Re: [PATCH] drm/msm: Report primary minor index as gpu_mem_total
 gpu_id
To: oushixiong1025@163.com, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Shixiong Ou <oushixiong@kylinos.cn>
References: <20261023072644.542364-1-oushixiong1025@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072644.542364-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b0ZG5MpEEADHA-cSeFAvQkTcp4QE7f7Y
X-Proofpoint-ORIG-GUID: b0ZG5MpEEADHA-cSeFAvQkTcp4QE7f7Y
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb3173 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=nDcocf_55Z5I0WzahHEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXzz+dYFt9Rfda
 g7xdn46HI3UUYejiAP731SBgdrGqT/C1TBlSUT08/zZTfCDbXXxbeGwYw/2HMtLwH+qLruVeyGF
 rZ8tzBWlY0rES4HufWGukBRfb43BaEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3kIslTQVRT14
 pdCCDRFD2e3GUVd7hPLpf4P3uBbZJib6759BSLCvlDMiizroFfWg8jgP5cr04IPdAk1vqUY4di1
 dNBk8CjZMBY8gx9SbJpl0F4cXKdh6oC4mrPQKodLAiA5B5VHeFxsF1Z+sUyy1iIe/J5VaPDbGWw
 +NjteSfqWQdfeINNiY1qmja1vt1C8BV7EeGLgcxWWelrtOOkB6iocOcLJzatFl7eEzdVnGsbFWm
 hYlfusyc66taPbrkj97vCIwWV8uIlw+FfOSro+LORPvS5U/vMfRW1Co47E3GImhxohTYf3da1zQ
 5xUxK/Psw5hpHsJWWxa/k/4vOPGE+LiTgWsVOFqtpXE2MhCa8xdvqDiQAKQ5mV+k44I8vM/lCXO
 IUCIJ66EzDVA2Woo9zHKroYFjgDrNM47ug2Yhtphei1aPdgGDdh8+lhTEyeBn9Ph2f5MUj1q5ej
 3hOQ2db9sLH5ZwDnZ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

On 10/23/26 9:26 AM, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> Both gpu_mem_total emissions hardcode gpu_id 0, so events from multiple
> GPUs are indistinguishable. Report dev->primary->index instead, as xe
> already does in commit ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace
> points").
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
