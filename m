Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1817C35A3A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552153; cv=none; b=kt4zvHwVhMuB4C72COtOUIrKcCPgk5RJ3IkLNy0SwEMMWBgAAM86UJYjaKCwqXYfyiob6fglaSkKcIn3W4vlgjO9c0VVkV9Tn+8O+3zbpnn/TzUh1+Mz+IsgjtEQyGMaZzD55JKHbCglPKUaDXpUpYhOs+VzrS5TCabBEXk3Kek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552153; c=relaxed/simple;
	bh=tRQCXgKtyVduFGdDijZW87qrNHFarcqJUlMobl3NQIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt0pjf0fodJnYDJeXx0G0sIAWedfKN208gcbPnObCavaYqfM4Bu5WFkgSZDn591lNL/Vbc98/kMnGrSo9/SIN1cqm5iVx4W7HC7/fxtjm5/cyTgGw7o+dpPWIUgK/2rEusYX56ZjawwuEXxOZZyQUOLHxzqqsRjXpTsMFtg2PQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6ta27ZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WanDSWYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6ta27ZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WanDSWYV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RMoP2058379
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=; b=d6ta27ZTlsxf/jdo
	/nsLxC9EiTAsiCuUNO8Wwk2CozrjNqx970szHEdoDQfO4/NVQNcat4QC+MzLe1W5
	J3NgWQ0PaGstxdUTng9cCGVWaZ/DQDaOQdlNEXNFRbDhPKOG+91tQBzGVaMeVgD6
	Wat8V5oeqtZlMy8LwqsHE4agJ0OGfYdtkwA3Ue8UasXr90CVgAhhVyUDHQFnVT7K
	St2Fd6CQzmalljIiO8U+U0kYZXBLRn99wFleb3lfD6aOFyNgzMFqkxaZdB8hRS+W
	0ZKvmWCUDa8EVK7ylQ4f2R+TMsYmwfSNoSS3UdQwIYRLA2rnMym6ni78+Ul7CvPP
	+e3eaA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0u5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:15:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c4f47fa57so32782241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552150; x=1788156950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=;
        b=WanDSWYVESssoWrfYYHU853ZKYMSlWI17JLtsn9TkCMvxJkeOWNZKTLWh9pIOBW8Z+
         FGxCvhqJ+AXjt2ByWLz3Ons41kfFWwPpECzlw39mMpacqtqVDrI1ES0i100nqOeBS+F5
         G3MGu+8RfVmQ03lFZY9E1YGr87CYv7FZXgGnmjlFOc0u9wUPEVbdYpyt7vZdlCiu764w
         pMVrLZDPN8nUfhihQeALVcozZSsrD2GJZ5VXvnDxEM+pnNtXpN4KPLAKp47BdRT3uN7q
         IIieGZl3/yjM5EikuHj3s1/ilEL/6LRbZUPa+TowEcJqw9L7/Ul29nBH32PeQdEcJosb
         qTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552150; x=1788156950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=;
        b=sSir0IyuUSX/IHK98GoznKdZLs+Qr/73WxQzo5cjsSS6p6oOedg2w2Ayt13GGwUYRN
         ZSlfDds5HaS17VCEef82WkIOa/M8JQDXnmD7J/STsMNjG/+do2A3QBoS21W1qLf+DBT4
         JlvsweLQzwwnCUZC2dzSbsdKjRWS6XegdQXoyVXsQoIBHDcv7Fje0MJCpyN+bFH6cXbV
         q4XQBreZa7txMgDwqjcGYniEhr/suWLhp3Gmbx1nlrAfIJRxkFvhV8qk50s4ZZosxXfW
         ExKaGUWTZ/VyCRmvu7oh73/ns3eg8obktItU1UO2vWONgHCTq3dnTfLUrtvRNtjlgSw3
         qWtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEOkYBWuLlaR+OzmcyQ+al4ffQMBcFbyJFXypXCY2eN2XVDq6WePkmHRiMFfV/IvHq7C6aIW6j9vNlXzAW@vger.kernel.org
X-Gm-Message-State: AFuF++mGee+SEEjCiyaC7aimageYj6LzcSFAjfy4tG6PpqpN4uqgY02y
	BllzTAhRdP1c9UO/awi6iaqM/7z5LUVoDDZuxiWc7QXxwH0kXWtrqoRCthWLu+huPG9BycFBc3O
	ethAz/OtAICkhLNqoWbNIimOJmHmdctiXvoVCaCDtn17/taAQCUZltv8SjBaEbUh/Yhl+
X-Gm-Gg: AR+sD10htFAuHTe9cquqAhVO61ywtasOgPbjLrqvOvyLyIZ5y7lW/rH8wkpTB6VMl0l
	S9yaYOXwGh3ApNp8IUQhSXwrO0aPxN61JKvcmmDnY3ld3l4tCNAnyIbEh2KerW10XiR2hRm51Ke
	YySRC/Kdk15Oab2fzqf7DKiIIqQyZ9SGldygkDVuSdjN9iSv7Z/CUGOAv7tvGufqIwwQku9Er5P
	4Ty8/Hiv8Av4nLFIh6taAZQPczAv3O1wsJQ1JXHOFtFKM0bkZfW320w6uSdXfZy1opf2J2Nw5sQ
	EqS620RfXD/zsm9J5rxJLfc4Mae3BnGcPur5C8VhjoYrpFZZyG+sLhXAySP67JKXn0D59n4Nt5y
	GlkElktUj4AlSG2SssbnDWQS5
X-Received: by 2002:a67:fc4b:0:b0:77b:6331:7472 with SMTP id ada2fe7eead31-77b63317868mr2098742137.2.1787552150351;
        Sun, 23 Aug 2026 23:15:50 -0700 (PDT)
X-Received: by 2002:a67:fc4b:0:b0:77b:6331:7472 with SMTP id ada2fe7eead31-77b63317868mr2098734137.2.1787552149949;
        Sun, 23 Aug 2026 23:15:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm6808499a12.18.2026.08.23.23.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:15:49 -0700 (PDT)
Message-ID: <06cec69d-2188-4bc0-a4ea-98d99de8a37f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:15:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
To: Paul Hollinsky <phollinsky@holtechnik.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio
 <konradybcio@gmail.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX5sN8IFWegkJb
 NPYN4WpABr78ruvP60VCJSBpg5nZxLMTJivO+GPlh/beRdL0obo6B4+EkUm94D7DijUzKObfk2Q
 rHzjEqAArSZKV89WRdqIx8vFS6AQheZzzuR1/KLuZPNFcxJ/h4ivqmxttIp2Xa2/aGamiQav/J5
 AlHr/xhZdind0okwC2+Y8jk9bO5AWfJa/R0+XK4jQIpI6xLoHtNV0LjH/DpAmWBWhWybGSfX3VE
 KtPf7IECr2rxNxPiBfEFV7cIh1qxXCUBSmDyXUrdUhmj5WpdERvtG81/JQv0bGLqAJikoleQ+zN
 KruYDbpmdM8Rkse0wwLucJP43+9qrQEAcvQWg21DNCb5wQZwdk4LconVo9wNv7f30XokhhmLbqw
 UMDsekppuq2eUeXrBT5/ZAEcR22JIzD6aeyFKpWI5tKFRLmkehtVJYt/bHljdVHzFscpfeQHJQv
 1uFyJsXrPN2fz+N3jBQ==
X-Proofpoint-GUID: kdChJQ8EzVwG9aEBNtycsme2bytoGAAO
X-Proofpoint-ORIG-GUID: kdChJQ8EzVwG9aEBNtycsme2bytoGAAO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX2/UrS86UQdgI
 SQE/QdqbD39YDvmlOq8+WjEBSARABl+hLFanCICLEqQS09d3Dcn93oCt7NRqcXLZBhph4HO9oVd
 a4yXxdVxBYvVnJsckLtF4eZUOuRNTow=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8be196 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=EUspDBNiAAAA:8 a=O9LFjDSsXfd6YXdYHBYA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240052

On 8/21/26 10:15 AM, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.
> 
> No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
> and msm8998 set need_mem_protection only, while msm8937, msm8940 and
> msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
> implement PAS - for example SC7180 Chromebooks, where call-availability
> queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
> consequently never probes:
> 
>   platform 4080000.remoteproc: deferred probe pending: (reason unknown)
> 
> On those machines the modem is also what loads the WLAN firmware, so
> ath10k never receives QMI and wifi does not come up either.
> 
> Gate memory protection on SCM availability as it was before, and require
> PAS only where a PAS call is actually issued. Keeping the SCM check
> matters: qcom_scm_assign_mem() passes __scm->mempool to
> qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
> would allow a NULL dereference when qcom_scm has not yet probed.
> 
> Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
