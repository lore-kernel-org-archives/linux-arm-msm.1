Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97044781F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917106; cv=none; b=NGcVuRA266MJAbhpUgX8p8geG8sACtVVudgyJTMX/2Wast7YqweWxPUU8ahiIeN61bPq5uRFbHHSrqoRZ+hxdi2pO0oX9AkOkc/hGoeQK94t5ENiQMn7BwXFhb6XZI63I2xigIikEAuYZQw45nT/99rRvDiiJNY0ndIykE8JvSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917106; c=relaxed/simple;
	bh=e4BUwiK0O5pp5RtDiOyjiR4KzXtinU3V8dQQ6IarSGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKHKIpI1th/+UA6U0Aj5V43w6lIwdiWI6DVqIHOFHtF9nLGnG8z5z/oNplfIu9eEzfTZ29fAjrMv4FZ1Ane7uS9HkWZ1b3fNUBnhHKK5RpsfADdtVL7KyXjU7WQ0EvIsZbUaLiobRyWt1Ww08zFGrEODuxLOwwp2P8dPxCyiUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymyc+82u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM0gfHz6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymyc+82u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM0gfHz6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7sqG2152732
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=; b=Ymyc+82uXFNNV3wV
	ATjIW9o7k3tDsJyBQxpPwgB43DEIElc9trTGzZxko2scs7Gxm7WyZpmgr6Dvk0oP
	oW59Cf7FA/l6gqm8z8Uv4mE5iX7CTnjTzrFyHHwa1keLY003b6ae/kc2nzU1YHm7
	JEwhbTEo3KkZMH4D+XV8Sli6sz9P728Yw82F/x+sEg7DIUOivzeQET3aLvrUM/MR
	k6qbSnOZ1PW1VggBqDKJUvy+qHkt1Z/OZcuoF40/trDv/GWtCB+iqrFuP9d8iEfP
	vPUFXnlp5cU+u59RaoLXxRzBFevV9JKD6+xtjKrIIJq3if+X4et2i6/HKxmwi3hh
	JpwRUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9fve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:38:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so1993811cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917090; x=1788521890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=;
        b=hM0gfHz6y0VlaZHkDOAmN6Ig6IWZLe/Wc1XxT+2kgqE2aO1FrR38UYpap4tAM5794w
         8jIgpSHzLY7DVf/F+e0Jevw9FydTgXzSiXMuywtULdpCzWNt55ZveI42VTjgvSFY5mNh
         Hnya8K/TQb8O1nqAfCY/YOHiw0BzJ4iDIJq2Jj+rHTELLFqUPOWFrX0ymxwmyVwOs2Hm
         DlTkBYJDewQr2EW8VbCFWz6cIa+woGltTLPC0aDnmNDG/uvgr4tKYdq2hNIbMHVwN6Rx
         kaNLUs14g9D4K9eNWVIyC6eL6fCLKqRD5IY8BH936CEyr+Eyaqk45cueIhPrbgHKMua4
         UFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917090; x=1788521890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDEypNL9kCp+XI4jcgmmY7WaJO3DwCuiT9/vCl1/MLw=;
        b=TmRPAv2yL1WidmZ7WMKWpRT6Su6jU7rovY3lgGXXvTn9D30okPdiYLf61y6hA/SaZ/
         xyGPjq/Lvht2YC7hfY3WkLfara5pJKufAW6sxNOJpPHjYUAtY2DUxA0xy2zRfdyU7Z1Q
         J/N0N5po76glzlrNZUfhe9Dz/Xe5JZ504oymiEdorYAoCffa1wZpEKAJPrwA+dCt/MdR
         NvRUFKPOntobvmr7bZJ8+QwA+EgILv4edzrcUEEF5Cj7Nsr2fDk3XXEYaQWiBZZxDzn5
         JJ9FqjbsijAmte4ptFuU2kiq0Ie7lEMCxPjxLbZCRN5FHKnIfoIGvyFozw5V3NKLfZNe
         abXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+gFUyKG6kOkOECR7haYhGYF7jcy7U3BugIrRjq5O30Wrhb25Uk6zFcwTDpfzfL7rIDGxJqOnoACvQgcNL@vger.kernel.org
X-Gm-Message-State: AFuF++ncbEMBRC/IIKV+bYnRWG18RY8yN4IaalYN8sNfnQTjkAs4duDO
	Ow/q/tfUXqRgXtfZAXlQpCgI1Wfq3Wfeu+28HpVsoVo/lCCsUOEVA6D1KcN6wtsVBqiVfcTzPkJ
	QZ02BDrMhNF6fUGQ++VHYygicjlhRuORyzafcZU5NuJNzQTtvS/RlqCycMVH+L7NNFMDi
X-Gm-Gg: AR+sD11k9qqRehhGK6Ou0lfQVaPcR3G5XosDmDBzBBHY15FbPcc7SmKReeqYNgN9wh7
	RwO8OKsrBxmTeix9dMZYJpVKH2qWgxKCJ2qwwJDeyK/DaNbk4BvKMTqr/UA5AJxrz307NTeHh2B
	GlW1lN5WaIlB37CrPTzOIgYldb14c0sEI2cskOXjxEcnf6md9TgH9YoPpS2DKEg4Mu6l3zJ1t7f
	JmS351O0biokWN7ZaZs/3ST+3tEFsUhWMNQyy75I604XWIrM2FV09DVRCL1n3K+5mWv3Uoq7ZNB
	XG41Yz8B9yVOkbxyk37z+DkvvBHujRmo16Sr1o1+3dqR8dAKpgouElBHfQuuzVYI5KcVKq7fDJm
	OL5rjTxig+gJpE85gDqKusZg=
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr49743091cf.2.1787917090065;
        Fri, 28 Aug 2026 04:38:10 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr49742691cf.2.1787917089483;
        Fri, 28 Aug 2026 04:38:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c5bdsm405108a12.2.2026.08.28.04.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:38:07 -0700 (PDT)
Message-ID: <647baf49-e361-40ac-9359-1ad32f5e2959@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:38:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: fix 32-bit overflow in DDR frequency
 calculation
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U8OtS4lyUhPhOimfWR0wKBhC-WkooiYN
X-Proofpoint-ORIG-GUID: U8OtS4lyUhPhOimfWR0wKBhC-WkooiYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMCBTYWx0ZWRfX/HmYbTSkDsB+
 9Bzh5yI0qoHJ9S2H8yIZwiEZMtREMGogdmppulehOxjwqyfX2v7XHl6ouq1+kLOGs6/wt9E/kuY
 48nhxp7ZmtCjR/ZcMlAK4jvUmhduYarLIjwDKJVDDHStpwiWnswEPFpV9++rXCndQKbrATctDkr
 jhPQhD5DRp44V82rIpKZDBv75DruGzpoa3v7mg+KpynIDpRqvA3WvLlpbIXYfFMsSbXI1/6H6C5
 D694/WHL3Zofl5L2JZQcMl/PrJEC7v15Mjh4zRzJUPaSUzBap/uLXhqr7L4QA74Nug582ej9jZA
 JNxn45/htTOt9I5O3pyPapD9E+/yTXOhGk/JA0+7E6GRxMDifJapy4XATo9ddAEYlNAIzCYNrsm
 HRavXQmhrSzzD11gr7LZ+dFNIUicb774GixA3WVp7+lnOkWu4osvLMwQ0yenET5HcldAdWpUivN
 yeKEe52JABCUvkEWZhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMCBTYWx0ZWRfXy/cTbW5qwGrM
 xdLW0NOEQW5JHoIqxQwAucMDerEOAbnzLOEt+QTAaNRRUVXIy45n/Myaz0Mb0Gaf1TlRBzOpT+j
 qDKJSNJ2hcKZ6v7Bi4OiGkU6C6GH1D4=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a917322 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zBPrFyz4c75jYLj3IxUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280100

On 8/27/26 10:13 AM, Gopikrishna Garmidi wrote:
> The DDR frequency in SMEM is reported in kHz and converted to Hz by
> multiplying it by 1000. Since the SMEM frequency value is a u32, using
> an unsuffixed integer constant causes the multiplication to be performed
> with 32-bit arithmetic.
> 
> This overflows for DDR frequencies above 4294967 kHz, resulting in an
> incorrect frequency being reported through the SMEM DRAM interface.
> 
> Use an unsigned long constant for the multiplication so the calculation
> is performed with 64-bit arithmetic on the supported Qualcomm platforms.
> Apply the fix consistently to the v3, v3.1, v4, v5, and v7 SMEM parsers.
> 
> Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
