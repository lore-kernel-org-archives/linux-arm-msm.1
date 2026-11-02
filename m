Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622499;
	b=wWaRQDwHTOE+BmjFvAejQSceg2ZEu7G5ho9wtuwicvAjL9R3uxjDC9VCKErHDFlUugsR
	 OewHAP2qTKg5U7UqMQpJNezm2v3Ys93hFoUe2oIg1bFZj+Jgb97yFzK5JFH6C5NHKwNy9
	 PdYkJbzWsXpgsNFyG5v3xM0cluFygpqlVczwEp2f+BFClRPQ9CSFZ0hyd420P2M6w8fSe
	 LBjwpbZlsIFg530+7mzNScngM4nwYzl/7Zrs3CS/Kz+GWJGhleyCOIPz34ma7Oi6Wjkm9
	 Z1A/oEdJhm3VZLgeXz279w+ssenQzWYBFwnS/ugFLx2Lfmhzpf3gjon7Zd5grXPfRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
	b=Gcq0kw4qB8DUt09OJ5Ruk3puMO3Rt2FxqkA3gZ8axvZdwmRmmwXwAOUzXlXpY5HTvSoV
	 1MpSvOalsoqCv8uhmctYDwzyhOa9px7HDjIa9SpYujmKcrLOrdtDTR0hep+r0JWe6zDnM
	 2hEqVpxO8uzNLrAUT0xql2ZDmPWYNJdQhcQaQ4uk04pD8b2igs1jbKIgsnjtV1KvIts6h
	 hIkYlSXQvFruTFQMhgRLZ16HT1dpmvfaUvLmOa+f1INT3jQD0m5RdLsVOXQ7WesEuNpKL
	 868t5MGgHnxJbYHamP1cJCfx05hlPfeVfJdNM2fMa964/gVBM3EAQMX9OHxAuvNXHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDOM69yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlYACiOz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8A606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C8A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDOM69yh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlYACiOz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7cf2466790
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=; b=bDOM69yhCw765fSf
	cZsU3z4KYTVIOGFIsSmbKBkhNaaatfw5Vm8SS0Og9YTaFxJEAIR5ad3ig+7fOA5O
	0Cz/3WqJv/KQI1sdNchkxURE5XfV9Enq3VpdOLXjUDzBXFh3PA6vhMKEuoh1/X2H
	waz7xFP5l5S08BTbSZn5YlGvnBDd3a4JywcRVNcLbd4UwKh3KLWBI9fuPWlu9MqI
	ToIF31IP7PtYNeec2s1hkNPT7dpeZ4uYD8yxyxseVGkJVMwQPmK7C6TU4obUEuNo
	mX/LGg/5z6WyjBsvcrw+v1Y27VC6VtQicrSy7ll66CrSSB6EzmFYOR46fhRX0fId
	efBgyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhsq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:28:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350173dc7aso7907941cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622497; x=1794227297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
        b=UlYACiOzLLcbABGxvACd+SU2L1vYXm5dxA/FVTaptqddtXHwbWlfqv/eN7Ul3gYEtr
         g7HfTCrcQ2W1b5km+7ugTkAo2Ska8v6RQRyli8opDEJgVqNua/XD1RmlYVnKvwJjjeVi
         DyW36leRe4NnXb3QKYbiudOIkrFABGAkGCTf2lhTvd8E18/gOtbUzFTe9Q54YSUo2VUc
         /tYrzPX/1dbKGXqTLR4nflnnGnC6muzPeoLmJj0EbvmGxGgWfs0X1wk1NdCHpVP0cwpo
         sYTRys8SIjszgKkCMqxrydE5ySoLfEs+agqDb1me2yCN+nD0z5HCWAk4dMVAQvFBzv3i
         nbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622497; x=1794227297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
        b=roKb4jCWvl9GxrWU42hhEp4b1tpBgEg8qxyUxPTnkaSTNyyn07TdVBrI1paO5oY6+y
         yb/CL7HqUXC4rj5dRRtGRP/31ZbEhDt7VyixQs7EecPfwpNXbfl/kBEm2jF598sueO10
         82Y6ZiCh5xx+K3mZeSHzbXtiyMxgJQJL5KrGwVFhHPSDJyJ/5hpAuKe79Hh70hhkIlNx
         ZeZXkOcWJgOsoZcNEvoxyZbsmICE+MPa9iC2v5N/D2ugbcu4BcBbgOsjwlBm2NhTDnYs
         Xl0t1ftpta8XSuHnHGk7uA7puwDT4eVf0Iv1RglA18gEgS1BJTsKm0YiGyzkkrZJOVHd
         8WXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuVmdTeD8n6dFwtwRDMvE4qhho54NxI18MRRZi9S7Gyd3Pn13DgGJMTKpyRt+nPGfimhx/p5AWfI1t258a@vger.kernel.org
X-Gm-Message-State: APuU4Z+jsln3hnUYCGE5JROwzw9dUyiG5wotolZFo4g0cwWeu5f0jsiH
	SXNpyKVtqF+O4+ZwNzGb6IP9SaAIEyVldQKoNo/B3iIDr4bfA562Iw6yKhCbmH886lMF4jLYLhg
	rJc5RrOVSLnhIXq5AkmOFCsIfulf5saL/TdjmPeCIy73RZhmWag8hn98uRJn9Y6+1/byD
X-Gm-Gg: AYBFou36EdETogPvNA44fJP1JKnpQkC+tKZMyzXh344ZHrf9zXhFXYBbz26yahyfTBJ
	x+Y/5daeKIUR9YhEU9XdrwF4K7S6W4rlof4e7IwM+za7BInDFLKed1DFPf6BmLP1d+50bSYOLB0
	JM1D4PRfTQdGi5yV5O1/AjCvcy0+wbU1V0bku4jrfLeRpBXKqS88mg5wF0iWuVH/f5vXi1KLYZ5
	nDb9B2T/zjdUirluWxNB/Hb9UMCTQFnt4IIrOkykuqlbwcEXgbisnr+WPLAnaty4pSGCAliq256
	3ehaKvFjK+zUaGHxx6s2yDRy7ytt+kNZeRezQ5bxWGn9TqtJFC8Ad5SY5UK44DYeJfxHpim4Vj/
	9V3kK1ihomVxOIr3RvSNr04T1Z6pF+b29Wy1I8sysdP4HRMtUjQ8OMwi22p3ByAsLuwrTpso=
X-Received: by 2002:a05:622a:244a:b0:536:91cc:465b with SMTP id d75a77b69052e-542b687b629mr246512131cf.3.1793622496810;
        Mon, 02 Nov 2026 04:28:16 -0800 (PST)
X-Received: by 2002:a05:622a:244a:b0:536:91cc:465b with SMTP id d75a77b69052e-542b687b629mr246511491cf.3.1793622496237;
        Mon, 02 Nov 2026 04:28:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1791832sm1508937e87.23.2026.11.02.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:28:15 -0800 (PST)
Message-ID: <361131a8-4d30-4e8f-92a3-697dd93e7e30@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:28:13 +0100
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
Subject: Re: [RFC PATCH 2/2] firmware: qcom: scm: Handle QSEECOM listener
 callbacks
To: Haozhen Li <dezige131@foxmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        =?UTF-8?Q?Dawid_Wr=C3=B3bel?=
 <me@dawidwrobel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101160110.3622-1-dezige131@foxmail.com>
 <tencent_B6F75567FAE05B5F2B1E793A9FC916E3A608@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_B6F75567FAE05B5F2B1E793A9FC916E3A608@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6pKy5_fwqJXII7WVgkiLePa9M-3tqYcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX0kRQ5oQh4Pl6
 U4mBw6Scho7iB6YnGzk56sM/9xHFK9UZGp8BEHK6lqczt9s3u+9EaHCwnchqC2h4Yu7gz+ihpWP
 okZsTCiRKsqa7CHz+T4Y/HGeLG4WOlmBBT/2Nt538Fi3K0wj6+t6C15Oid8wQkIaFvzhAJDUSgm
 hYUY4KFynlsQN6+V0pRpJZfoXZabuYLIWHLMcsOdIlibQ1rvb9w0ri1dP/YxbGM6Oc9W2lmqc2y
 IxvCF3jTLIeJKd325tYAQrC6WAlgYfJth12bcrXPInuutMl9YITKOQW0BSLYCPZ5M5xDDeCV0UA
 SAuse+ng0KKvSZe2gi9vAg6dj7Hjne0Wh8vtbLqPewFygnKTmHgQXtQswDzyGGk83DqATe33g9u
 USIVXgrsjm0yg1sVjQt5Xg2LdQjTmzz6fy66WONK3QjJaOB6ScC9e+GQ74DDHoDB4Sen0KmDUOz
 SbunOBm3pLyiIFCgVYA==
X-Proofpoint-GUID: 6pKy5_fwqJXII7WVgkiLePa9M-3tqYcc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX/C6iCu417a90
 pQBDiPD7pqTZW4+inJeQ1apwP9ZC3+RiRhWUJZwG7g/ETmPry7j8998SvsMV2klaV+pgGkJ6dDq
 iUahAS3MS+XcB8/F0JI8vY0JwxxawMI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae881e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3N2OMTQwUvkGbx2wNlcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020049

On 11/1/26 5:01 PM, Haozhen Li wrote:
> A QSEE app that needs something from the normal world -- nearly
> always file I/O against its secure storage -- does not return from the
> SCM call. Instead the call comes back as QSEECOM_RESULT_INCOMPLETE
> naming the listener the app waits for, and stays that way until the
> normal world answers. Answering is what resumes the app.
> 
> The QSEECOM SCM helpers have no way to answer: the TODO in
> qcom_scm_qseecom_call() turns an incomplete call into a WARN and
> returns success, the app stays parked in TZ, and every later QSEECOM
> call returns -EBUSY until the device is power cycled. The machine
> allowlist in qcom_scm_qseecom_init() exists because of problems of
> this class.

Please extend this RFC with a user, we generally don't merge exported
functions without an in-tree consumer


Konrad
