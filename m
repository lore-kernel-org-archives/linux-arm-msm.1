Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626371;
	b=tJckCU3LQ3+q4mmXo2qdmz2ulWu5X72SlV/DnKvDi6dZilbczqz3eH7nWb/eBVudsbxO
	 9Po/1ojI3PEn1li/TfPCEU04ySbDTwIYHinTcM4FyF7MjIaBsb6yPRWRorwMmfUydrTVd
	 1tx4t5kUVO4QM51OG2ChnMQYagVd/bvvcp6cxKTwjGRf2XObEUdQKd+vEv7haGqDlHiRe
	 R7RoV7hiExf7k6UjDx12k36+1QHPp3EfYP4mPmGgVDVqF5K7tFJiHl3ndraZlqztT3U1i
	 DiyzzjHHdRJlwgtxKVbAt7D0+3Se9TxlHNawuiCPdSO1/zVYIydcRRGEGXe/RDTL8Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
	b=0YfRezH42rtRBmBN8mOM0q6Yn0nckt/R0YIaTFwqiGk3dPkhMkk3oVt+RTX+41YsbgfS
	 cL7ZEYQ+HomktqZNqbvxaKqfcHHiMmSQbjimR9uwRj1jvJExUAdo5QH5t/rNpeFdQJ5xP
	 Jxc1NRPFY4ml6fcI6RZp42PDiOD/HiH6TWy/cEddDY77rjuJAByYBlaK66T+HUUR37s5u
	 wBZGMmaAVk+6KIjvckisW8U/ZxCc1QIxBUaA5byhhBB/Cu0UVEjGHQDcF43LVglyGsTLY
	 Jrw83S0bMmVZBZjB+tekhd9UTtShvk5orQqTzykaIZ1F8p3Q8dyMDZ4M3OABIvedczw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=axB3ldXs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF17360A2600
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF17360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=axB3ldXs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAh8c3014730
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=; b=MGqHquVVfmYGpZUf
	UHJfPKtiltdD0yKxc2fIXQfjt9UTfEzqzFKdIUbRdGKDQMSFaJShA/ae4wrTmx4E
	+v/G3O4Lnb4ar85ZF397Wvi2Qr5JOoiD60EYPbKlJS0H+luWBfkr4FXboqs5p2bD
	VtmWiW5Oqr5/HKmXFMaLSR0gkR/BMJ4RtYj6PXW0LksE6zjtLMSrypBGtuUhFPyL
	XW2i4+3qXHUCV0JMqVAKAft5qHgbmkrW3Zm/RH8pkI+v8FNgihIfWlGZcmFkzxu0
	PRq3LudY6pr5Dfeib0rzJ/GBmbQ7IDmGS43TNHIG1afdhJytoRFsbHYyL7lWK+KX
	p8arDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj102-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:32:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso3703449eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626369; x=1794231169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=axB3ldXsT6HgawLc35F+XD6dMxxyfvCdcCRLE+i807gzD4NSGLm/7mxXVc0WlkRI/d
         ZKTHGBdUmoA5MBjGkTZClvYDC0SiNNm22iuSdhXjsvX79YtywtOxZtRNQLF8UgPQHPFi
         fABfAtjGtqAxhbCJfL/YYCHVVeG9s+Xqu29i9DkMSPSIh6ciUUnxoQ8bSqhTHQFuQywh
         IZ0XIko3m4Jwl9eCkidQVHGgWrDFaYtVCBg98TljTcnXAN422vCUD1Lu5OsMBDlpaLVL
         j15xsfy2zKXu2B5cHWytFldaBOyycvxWh9t7hVMUCDH8AzIetu5H5UiUBmRf5lYRjjQG
         056A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626369; x=1794231169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=mvZJ6P4WPWcNxO1a9pH8D08XkJwLVeQ3tBokPlmHgi5+9ZzP0GnVXib3mF7VsnS1iD
         ZPl1bckFLU7CAAyTVE/j18/SXA/QrKNKbh1TsMvxqGsGWDhKifuySzCLUjw40r7SFLCZ
         euMd/fGhnds3L3t4SSHRcVLOmw8cXOXn39atEwaQWYkxiMLH072e42kDr3rpSvQ1sAD7
         siLncpIc/PK4wMFXzdzKbe9m6y+motREd5Yf9f4rg/yBLrPbEkikqrx64MGX9J/MEzq6
         ldN1sqNuCnJo/q6m6kXfoJUeehsZZTfZRtI4Bpr5XSsVzMMjwf3KJLjDQ46pq3spZSVT
         O0EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE92ZwjH9CRh2nrEgf1V+/JdlRbjMWtDSbM2ByA2sLOvFsx35QswcVbnA45Byq2/W/XoU/2hC0gVTO633l@vger.kernel.org
X-Gm-Message-State: APuU4Z/FuMa95ISOgO+271n0i5I6qKkDmB4vcJKlvhMQSQoUAuOuIxqJ
	31bleBf3Ms53yTvaol6otVrn+GKgotr2ptxFYrXnTp7W+mOf4+Z42wUaVRTaxspfjY8hIGuPLdp
	MrFWzj1COueaAD2QK8OuI6f4V6f9V4foFVrRltUMZ9z8SYZ7A8UkqQHMnsczDnGqKfsyo
X-Gm-Gg: AYBFou3BalEgiqwxmQrr2yLUDazqYHHvn39vWNGJC7mP0WrgtIobJI6hZnl2M+fdnzq
	bydjWFlI5ByHh8oiIM6N28L6HSGlQCq4wyK7Hgr0LyG/ddYkVtDHp3T5NfqWFaX/XKcHV+DJY3S
	L0Q4Exwq+VEv6VfGUX//WkEtpWg7VUHW3vekNq8xgSYqxBrLRdM2MPl3oBU6KrGvBW8/RhzUbyG
	BPooR4bRh/dZ0kmzAZ4BzsIRzjaA69l7NYzX4cqC/KyrX5kQOQ52m/se8wm03wuBmCal0pqlYTH
	kb2f4xT9svDrnF+PMlZRklcYGVn9jjW+7smEN5jlkdjVSpjDrj8LOthHGmDiIjiea2y0wFOsGX/
	d1VH9r6F04lMGFeUWlNIWgGPIFvuS/wnmdbXrZHEXVUnDaLAsNEchMD6cCHsUcbKeVWt8uxHynL
	+vHTz2bA==
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425572eec.12.1793626369468;
        Mon, 02 Nov 2026 05:32:49 -0800 (PST)
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425524eec.12.1793626368612;
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm17186741eec.17.2026.11.02.05.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Message-ID: <74397996-99e1-423d-9a0c-dc17ff013239@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:02:42 +0530
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
Subject: Re: [PATCH 1/3] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RJpmbo3uq9ojRYh2IF4A8XiLOhGidNns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX9kmyAonKtsnL
 rU/2NAuoJFFDKjop/ZV1glOchIPBkE2hkI1Ej7Rfy+wK/Z0h5+oaN3EkR2D8UB8Sp63F7jNq6T0
 CTu0zbcfYnIEiuJ+gsd9etRngSCLa/iMZzSP0ZW32faBkge45QxPM3CnuNgv0bH0fgGez+DoW7b
 AVyRMQjo86zpa+BxJfGCqf9r3Y2dXdZqRzh50Ex4tkUXgRYtasteAJihE+B3mOHbeQjswPfmXZ/
 HAwfFot48ea4xPTQ7C12glDX1O/Ve99h+5rQhKZ4w5mnxxhlEpchAycwAd/S15pVyLFpVipvwxM
 SIb8wraxzFRiEzIZAx9kuz91DWW24mnZ1FDUdmwkpPwWdXg8Pv2X4kKfXc4X3yiRqtYn98CBCJ8
 F8Cnxri0AfoRIwBTJaVNWaA1orzJoDpWRmZWD6SH422PPqegtf3er3nfci+dpRCBZlEA1wzxDIW
 yCL7VNby4UXS+iKn+Ig==
X-Proofpoint-GUID: RJpmbo3uq9ojRYh2IF4A8XiLOhGidNns
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX6zDzj/Iz/dPz
 mlUpXA6ynVtWl6KMYHhQODH4VBHqWc18sPTlBH/3Udx4A9i9VNcSkUoQI2MEj+kM9klV/WAfBrn
 84LIH4bELthXgza6ngPX8ACIPvxahLI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae89102 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fnL9iuGchlDLWTthXDkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>    qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
