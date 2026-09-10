Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC533DEDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025387; cv=none; b=aCjtXe7FRvT/jYZ/Owa+moepFjqjZTOb5dSA/yk0kWMguEE8l6QD+G2fXZPtZUhEJlr2l4FE0lnw+IMes7UvR0B16Sv/zFYh9wFi3QI75P5oVfazd5N8vu0elGz8GIJ3dYRmXseaOpRc1qEYBbXbHdqDBa6JVbqSHREoyNBVnW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025387; c=relaxed/simple;
	bh=MVyliNQ17fPY/yNqehZqBB/HewQdBtDDGcKoK+pcHZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nbc/mcGB4igk8Zi3PeFQD635oabk338lGnXhJsEEOrXlIDdYiqdjKy9m9G+Curptkf2Ar1Fd07LQjKxcOteRP95qKE2PiCcJAbGf/wwPIpqTm/Ax6y1udXzlcsCbgoQe1whIpb2kpPoFR0q045Hxg8s2HIKyiVaRgVOu/xE/RMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8eKzICL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRvMRjE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8eKzICL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRvMRjE8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GweE4142685
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6/u/dIaghjJjICKdREvgg0V
	54dkEaFF3T83sruoD7w=; b=l8eKzICLsmop4Ag3liyNTdS5IwHxadMK6ZLTzjUE
	AXGH2h8dE9MzI7cKsY8PPPfNwEV/fEVSb/4B1r0q/hXU4j/mTLJvYtQ7j1N8vvuZ
	YbmtQttr1+GdjkTY4VDYgU+eAJvMZsULlXcuUC31VIvrWC2MZcHO/cv5M3R6NTsp
	Opw8wspMSC90tYj8F4Tyhk6IHkbo9KIKCyVqf6eqMCKhO/yME64WZtDYlIcs4H7G
	CeLFoT86Th6VqJgEYPVBqfn9CgiHJV8SoLzeOVqHUlp7D5WXJXftEmX8cIGabxgP
	jC3VctcTtGBGzsMKMxnMfoi2WGkm27edO5Zl7pmdr+HcZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2knq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so141218585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025384; x=1789630184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6/u/dIaghjJjICKdREvgg0V54dkEaFF3T83sruoD7w=;
        b=ZRvMRjE8/6KV8ffu2S8B3rP6IDzfrYqjPpeQYy6kNVO81rWC3gJ9X0xBsqfEhgZTd3
         tgAHtLYeVS+sxhuXsxl69SFR+OX1yhiFOma0uT+bLAgsKAZ6hdcFJa5+KSMSBHT5uDen
         Xen4HK3F2O5BK20R3VpESOnG65dP3o1aahB0i2qmfV9qhRWZwKjIKuK/I4HKpvQeYBCo
         478vUWm35IoD/Cp1dqHuw5vVJKauLlsut4T+uHSiypYTehWG3Dq4TieSOWqUsizVf8o0
         kmuQhO1vJp83jY9ixYm+33b0Ll3rEt/tsFFB0iH/bKO/8/iypkjZFmFziawkCiSSFT/m
         LabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025384; x=1789630184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6/u/dIaghjJjICKdREvgg0V54dkEaFF3T83sruoD7w=;
        b=QwOzbhQhACcwyPUAApeyhNowjlEwevsMGDF1wNI1+ebdfg1kevJO6OjgNyEZ6VFjyg
         YD8QLvF+49IfndU8riHLo3G9/golkCqxOhqKk/nDBUV+kmOYyRl+9qx2kPEyjoeWd2d5
         3pPKZJN9eeoAZsaZP3EahZDpHVg+v1ncmPUoS8mJzlNfHGtTmiiKkTtudI9mdU0ISXF8
         +s6f+wAKX8mpO2lAQRU39BrfqZy4tE/gOBgDK/YmAq7AFapkntaHG4QxK4jh65m88aHx
         EvCi46IPZw9eLubKrfxWK7Pcr9L24D0j3z7kmqV44xKzDLa0GPhXRVQ2bzp0Nlak7bHa
         a1Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzZj5fDL3QfXvCpaNPKgcOv12q9i+9jWJz4TuAs4ducr44sAcjkepnJQ4ofrc1dkjZXvilceNSjb/v0ZhuT@vger.kernel.org
X-Gm-Message-State: AFuF++k4Xy4S3HqNklLt1g+qnoR/Hi4wmyyTDrYUHTvjz5AqQCEObAPc
	FXhakLeXHOmlMBVxVnzKujRa3+5CF5UGJRkWevppL+D8l3KnhGeeELTzxjPOhCieLLIBBfUSq/B
	IRWJIKsdie1uIvckIoxjT0pJKSsjiEAwXf+6PGvXUH6UoITP2hQsY/8ixCaDNpmUuSkV7ankG6O
	Mg
X-Gm-Gg: AYBFou3G3/5qtVqZFX5V8ukkk+L5JG9js2pYTyTvXGDd05qy2vYBnIUGvXepSv8wkBg
	gbpY6Btqtoz44q6yq1t+X0cZaLzPEJt42GCyrVNwWYofoRvTGh0Oui7NtjUCKChz9cSVM6yZPaC
	ntbDly4ExPyuTCpZbxWdgKaEpT5gJxcJ1UD2Jmdvr0O4v/XGdGX4fn7pOaFC610YDcxm4KgH38P
	Wxwb4xe5z1jagmmBIN2+1ze1W/8L1c4Fmr8tiET+JbEFw200hBVswmRj8GbJMJI0OCAkZiqicC6
	G5UtJir5dt6CzdWl1LIyquguDHdvYx9Y/yE9FhXgHkGF7tQKgwkW/mStc9sN/xIZkuLkTS8wvWJ
	GenQpCNGKgrsu
X-Received: by 2002:a05:620a:4623:b0:937:17f9:da2 with SMTP id af79cd13be357-939d7e3fca5mr418218485a.6.1789025384102;
        Thu, 10 Sep 2026 00:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:937:17f9:da2 with SMTP id af79cd13be357-939d7e3fca5mr418216285a.6.1789025383602;
        Thu, 10 Sep 2026 00:29:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm248806275e9.4.2026.09.10.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:29:42 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:29:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] interconnect: qcom: Move bcm_div() to common code
Message-ID: <yk355uolomdjhwamb2gco2misljktbc7vooxv7onxdayjm7aty@aw2latbupfza>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: kqn2gSeMVXbS4qQSZSRkpDn7h8QtAdcE
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa25c68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wiZ877acDUlgFteYXlMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kqn2gSeMVXbS4qQSZSRkpDn7h8QtAdcE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX7c7JvawWKd5K
 fIOyQqQJY9rPulYehGzIqDKXI9Y500HC8Kp73ZO725aPjFMPcSATYhYzJqmy7NqcXdok2/M65V9
 29l7bSqBhsRLxj6SYXp/5wiioAMbnQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX4Fp7cqjNgxg+
 oiGu76WJnnKbfXerE/JKmeHZBWW9ay7v6rMYbJ1P+KphnaETWxsdgu3Hu8j5nan27jXP+H6qymI
 wYqI8PVAGU3WFxwcdIDHxF3EVaBp60/GlnoJif9NAyUadKhonD9THelotTGLXtwSjSqol1Brany
 Bwo98H5VIyXQlPCHSAznArKRMQQ1lt6ecNZoSJcdLns99foeCmcwrFYN40fdvnoFRl4ExLzOjn/
 b9XaJcD/UtPqsYRQgkk2QF1BDhilhaKMTEIdYHbnUIGZY8OObZ7X3NrFd78GFHK7HlKmIWZBOC9
 n9FGsnQm1C0QIOUGzCAB20aKkm3f5wf6ELLSb4j5scsHsdM6NZigOBEtzzfa3LVsMInxut79Sq4
 m8OW8/+C6Pl03DfFqcf774fzVnukacZBPJ5gApuQemDWSkr68Disvvp+HIsx1bkKutbuD9os2QB
 HL7ZYnY7h0pHSgU+PfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 26-09-09 18:41:54, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This helper is useful for both SMD_RPM and RPMH code, extract it.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
