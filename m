Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667913;
	b=SWwh5HTfsPtOKldOs/nXxXKbxkPnNXoBpTfgipqxsKB7a0hf37eMCeMwjdvBY1ecxuPz
	 nymiM8LYg4KuAnK2JRRPb6PP4ZXoG2l70ZeZ6/a7pMjbW4qIpdceWovA9VpCB3obsNTxf
	 gb1wkkLxF3SG3wYeoTlLJlLnMNiRjJi3QTscyUDQEhiMbOkYPnboPrtgyg/T1mSm0bEij
	 pIymHqWxb97omG+SAAbeAdcod+V3/JxWMgzhHZGKwPAAM0RVvn5d1nH8POJFRmHyvyqdG
	 Mm3n77WJLWBLTtrvGMGklo9g5W2Vc83m9HudkkKranYj+v5YEPCBl1ksmJjGQ2L+dTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
	b=JUVruLrHH7VZwcpOmMX6pX3aO6nKHJ9e8Q25ZKDTrj5B0GpU90OHiWhmYE8OuWjGuJwJ
	 pVvAieYlAqGE877calbPb2I115BprzAqnpvo2VL/3v1HiVSdwc4VizytKlBUl+eDjyuAy
	 Mh5JoGWB6lE3uaz9/tnBNKiBMCTXA05kvyqIsB0aINtFCaw3hWdjRxpW6xK2DSjVewRe6
	 zWk3zTJB0MzLdne/kveOBnMA/gUGwvilLOZIA+maGRFs52KUUm1EDzXh9VAzj7T8jhaEK
	 caQq0pcW2QecIVgqbignX3KfPd6sjNk2kfZlswKVCQ+ITKS6j5XfavAT3CcgOZUuTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cP/y3WfV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4E606A332
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD4E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/y3WfV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkXiQ928026
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM4vHc79k+V21DsCXm9ibSOR
	voSng+h2vl6tYKJCPEQ=; b=cP/y3WfVHHAWw346QA1QJx40/eYMAkSFZFVTchG3
	BUUHKFkcs96k+R7KTGjl1lp/cYBbw/7gpGL4Gi2iKY/zNrKebpSQEvnydZvOEykr
	mv6YXQKSGRRSIBNnvTRHbtk7Z/Ap26GJhju76LlGkhdpgizLyNMMYUkzLML/y5RO
	G5SW7IkhSNPyrOem68iOHkO60MDsqspFsWv4mzDz18JyRqxCPnJkwK3dM4mMo75y
	bFZas0zZ1PU5Mm1HeKgoPsF4711TP/wXoAGUoBOZuC3do/056vAg4oBF+vowxIy1
	pBxGdU0GEypIIlvZFMGf6UkoKriTbIQjCwFGvREFTlJlxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhds0by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:51:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso28693485a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667911; x=1795272711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=WBxd177XnfjLfFDeDH5I776Fl+30W2Bs5SS1kifemAGoszOx9CF4dJymxhTyure9sy
         wgaa0nViyU/zfclGzhwn6ao1CEq7GXfGNdZddrRWjo1ADYFowkOtgdTLys5zMp0QC01S
         i0tP4pF+2t7XK08d7AP4mXOLf4cmfg3T/XdurPcSUQDNH22GPCKJBN5dw5aVa9iSYGR/
         WluHNKOzep5EsguiJwmFXKVr5emp6zxgKsdGaLSTAsGPpycxJYLp54L+7UQv2P6y4LgK
         4VKd763oQ0MYbDYynA9G53TSScEwdRef/OFcBZVdqRw86DBdQxUwP5JfCzHQHQJ8Sk/L
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667911; x=1795272711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=NhGYo7qZADD5L24Ef07/zCv0NTJ9J/rUi+4vcmSAwcmrBBorwR9TOxuY3R39PguVYK
         r8sapSerPLEQn3+zpAUaIDJWidqw9Q6iRUaUNcrrCA0BCcgc/xOqL6NbSw0dFg3vPKih
         5ttjk6chN2fwOiGr8GtvNYq87EJkAyonX6FGKvuFVrsNiX2WcYgpCp4j+MV+DwCAyFif
         TVamAt1oCKnsWObR9FR038jDpeZEECy/TDJgKawcqH79RucQsmblDiQe7tN+3HBNwMlE
         Ael2oyw+Uz81yge9M91l7SkaUUUvslPoN+vKeqG4+QLiFNnY7kNr6epwzJ4D2gxfGZLo
         5hfA==
X-Forwarded-Encrypted: i=1; AL+hErG6KEXRinStOE1k4LVQjnk2C8RVB7RCjCkRy4A1L7VOlrRTT6/jDV+4iosrw7CrhQ1d86C05t8g3nzkHeGa@vger.kernel.org
X-Gm-Message-State: APuU4Z/xi+UOsNYgpPbfnkWxdyx30iHPiuLcWPCVU5UkZS5+ZhqDk1Wd
	pnozgztyST9ngd8MGrjgwlHv2BuH3vwjKus8C2iw4TY9Jjvgwash0l5qfP0wfbobK+58fGtt+cw
	mQYdxEY+2Q/Ath+ptZsHFx78qczoMlOi5tuGK9VrKHN/0uQMOSrMxO/erucB/9OQeT7q0OfRrrT
	Vr
X-Gm-Gg: AYBFou1DLhtb2FRheOBOBa9PuZxosGbWV6r4c+q1WeDevvFfiBSdRVMnkQqqQXTciaa
	pu49VO/kQLXB0o7oQUkItJkubu/P5lEjOUeQrmT4GIRm1mpsHogvD7jSurbtpU9QwqhosbLKeSU
	RDR+n0JPeEA9XAf3lyYP+4pKbWvo/ePrXmNYB/UcOw3tkMsZfLXruTz43liEmMZc6CqUDgiaXdf
	Sx7wmLmXx+OrXQ0QSZDFh/kmP4ZhoTgUQhQ15jvdjU+sloRJlKygQrO9GSubn+q9Zcud1xL2hhz
	88YD1+YNHbo7QT5bm/jVtPQ1CavmVDOR21IOeJR6JJlhkhGYR/Y8+jFVSvCp0Jwc2y5aGmB960h
	8Fsy4K4Y4WseuIkjRTexMdfq0TQBTs3vt0nhBPhzVOrgcChXtXKb6RI4g5b7NHE5c
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812477985a.50.1794667910858;
        Sat, 14 Nov 2026 06:51:50 -0800 (PST)
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812472185a.50.1794667909973;
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm10211991f8f.27.2026.11.14.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
Message-ID: <cokprcupy7yxhjgwpu3ycgm6rpgi5khwkoppxfakvms54kpbnr@hzsrwxiayvjj>
References: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af87588 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rhqQhfuC2zV-thtKVLMA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX6A4xlm2A6CE/
 /+rb/H8JBJKIUVCg8ji6fs4yB+ZfbTkkyCTNWkpurrX/dHLjw/E7jOHEM7bXJcyGR6PBlebE+YT
 tNSd9ei/ZefGKdHYebidnUZcsnsgkWg=
X-Proofpoint-ORIG-GUID: jBmf4AUDbmEqNQ_4fFklOCdMnAeX2c7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX9jEQECyBq/qL
 Kpk1DPEfNEkUjVFDHk/hKjTLjkvPjDwNdpmHK7vfhDgABov7SRFH1t+MJMPjnrYgvFiqgbqb1ms
 FPDMS1iuXJCl/M4Pbb2u4/uvKFDtxExGArGXC2WSlTfBKwOMw7ZKvYpW8D4488INVBG/F/G//M5
 drhaTy/ItQWntLn3Ydj3+BKBrmD5ZyYCpOZxhQqGzgUZD7on+2d2D2bSxnKz3YyC7Ey8kr9xRyB
 OZVDT80EJLRZ1cTwq8ZE4yN8zt4kE1QVwFqtepdgkhOvv/A6M3C4kjvhYaFD6FH8gFYld4tm4mv
 5CUm5rr1zperJXXUSxl9DhTKO6bYsldChXtDX9jPSLmYTqCqizC1mWXo34Akl9mmz7XSvdtI2Tm
 Kpr81cwO3aaqpTAabpRkE4HdUDftLPc7ps/Dt6yrSpFGF4EBcemlLh8DEFIXYJgsjWIb08gr9xV
 ZfolDUfpXoeilF3JRmA==
X-Proofpoint-GUID: jBmf4AUDbmEqNQ_4fFklOCdMnAeX2c7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 15:52:23, Luca Weiss wrote:
> Configure the firmware-name and enable Iris so that hardware-accelerated
> video decoding & encoding works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
