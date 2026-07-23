Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D777426D03
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799259; cv=none; b=Sv9VXtCNvrV0DIN4ABgJMtn5AROmzE871adcNvz3gSQmmDslphl9PM8quEcjU6Ubfqc221iccmF2ihzhmFpJVFYV1YDwI1Y7tEt9lSAblBnn4jLn65whQXvCxG4FSjLhprMl6GlQ5hleftlMn0M4aguwh2g9yECaqJ/9H/bEav0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799259; c=relaxed/simple;
	bh=3ERx3QEm5vOrtZp45kHOZ2Xl4tp4BshFW+OL+xcGQKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lB1rmm9Qb8lKsmdJKRppCemWdm5vKY1X+0xWxcwywd0B6PskRPCoaW3pHXFOJNhigp3iCLG+/JTnX9em1PgHeBaMH0U4L4p6Lq/ts92Pl/D6LAcBeEOEpaLnu2xIgghFi2/QTAk5eFYTj8pnMQ43vvnIAb0CnG7QOgdsy/48BWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtKbG1Dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYcVguHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtKbG1Dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYcVguHZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbLB3606139
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=; b=YtKbG1Dgfxa7z2w/
	7xpxdfoVQHDPHg7BwW/FoUJwDpYkEuegAhCV/pZXax6Bbk3OQF9mNH9oLSYxwPLs
	oofKRX/+r9gn1Z/7B3Ss6XiFtjxzeeaxQQb+IQtNwLWb1+Ek1WdFzli3IyphAyMK
	mAQGUBYmGKYmOrGNr8rjUi2hIWWu7/TZb0HaKLxKdrudpF3lDEIbTQfCZWj5O3zF
	NgK+02k9T9bdn3lvTpUDE84HZjuQ4n/SbTtZ5MCZN8UlWgfioAKapkaE3u88fofp
	eS0ScBnJ/qIjZIcuyXhdhzlpqZD8dvPkPmF4gtfGH+JI9kL3CTsQtuUxg/KOpxhc
	98VkIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qgkju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:34:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c069f73e4so1835131cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784799253; x=1785404053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=;
        b=SYcVguHZhsyG1NcVnKgpc818ZhCh2m/S8xxwC02jL8cE7Zab9SrqZGXlQI81yWE89Z
         KLd7EFhOpzgdsJLtHh+sSRNo7AKa1XVNOwPmJH7j1QJpqvkTMB1jgN4y0eTLHquolv3E
         NLhj5E8HCMj2WL4aYPQ3Na+VEEn+qvBGLWb+hZP8mBREbTiLcsC+rvYivNu9Jg9RGMCQ
         X0WaumagehgsoeoB+wHFrYXp6up3C/oNrg2mRNd2ZnaKwCb69Z0g2Fzy67swM288wcwA
         p/WF6ETv2X3/n/NKLEPgPlH63wec7ufMraWDNIBH3uRGtaO658Q9IQ//4ah97FHuM2V7
         rsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799253; x=1785404053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJk/WEf9xX/T6XBL4N4jb2++nwLoZNRVcvk1ujXHkFk=;
        b=s/DtLdbUJgTRr+HaiUQjTrWV5jL8qeuqubTuhzGyHhC+lNm4XRQ6r94LCM68sYNovx
         aO/cUfUAnJNxq4E6AA2cUEUZ25RnMrYWcbJdtIT8HpUrrQFuwibzZUr7d5BU4cq4DZuC
         XtKsZQCn1mff0B9xQq56u4fCSVkk3vZ2VqGJBa8LvbffepOmdp9clkIme3gLeqpW0g2r
         NTAJyZixd6VzrF6rmFf4DKyyDJoRSIUg3YMq9gSqYIX1WbcQcYyCYk5DmQg3ZnvuG/n9
         MOOLV99WieWE28NRnuoLD0Le2614vyB7mhK4Kg2yb22ClvTnlWFDXDDPFDiBWwW1cmOn
         FaZA==
X-Gm-Message-State: AOJu0Yw9r8OZLZp3rul+bEXz8ycEBnI+9QB43naNAuN7Oh57N8bA2+GP
	HlUo5dRG1KQTQRZiZ8TDWtjdPj62Itieec73gDIj42CcTZ3AVv3Vd7RhyDbWN+G+uSlT6CuhmYw
	+ohACyX2Q++yqHbP+/ThVjkAG9vx1Ux2AF3VoHAPWUhMeeQlQ9xdaGiOQAnFeQoXWHJ0i
X-Gm-Gg: AR+sD1221QbBFL9nDJagjQrOHhq3mWQpd8YVoUOeNTwEafku2oVxW7N6aU//pOGIkqk
	FssLNZqFE+O31PbThlp2GzjIIGuuqGLJqjCCneCuYhl94yJNGud3i9Lck+MeC4xYwksOC2lxKO5
	NPuXN8kQgQu4SPjBey0N67Xap9sIUmpWW0PZQoA4r7DFXcCyTn94csmJQrDG2NtUFWgdRaoQSAM
	ORfZF1Z8PIWiuqdj5Cx+9t8XUpWC1X1BeH0TIKaaUMkJW5wxwBMBkB5UIw4lCCp/6Hpu6g8gT1g
	LXwfKesmxMK9WlVGo8QkuacWbwE3I2Zr3W3BOWxOb1xqAXwOCTAdJsZy7GxmWA4RGq+dO5Io2xP
	c67wrJxdPi3PGVU6G13/wejFQ
X-Received: by 2002:a05:622a:1455:b0:527:7076:7859 with SMTP id d75a77b69052e-5283ded8570mr17983721cf.6.1784799253543;
        Thu, 23 Jul 2026 02:34:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1455:b0:527:7076:7859 with SMTP id d75a77b69052e-5283ded8570mr17983541cf.6.1784799253086;
        Thu, 23 Jul 2026 02:34:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm210300766b.23.2026.07.23.02.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:34:12 -0700 (PDT)
Message-ID: <20c703b7-306b-4026-842a-a62722d96ad3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: Allow shutdown of crashed processors
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-1-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfXzyQvh7waug3L
 lZk4eFhbywNXfngCoNaFG7LHZgrWIoB2nPPipOsTNj/kH2M9XJDWFAIeusPLeQW93pCOTBUQdte
 XEh6n5Qi7rSMvFQRfqIucR1t2gEZEtE=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61e016 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2pRFMVAohkf1fqEOkS8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: m0iQlgPkM6chbvZMw-6PsSF3bEUgBOg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NCBTYWx0ZWRfX9I7OINwDaFPz
 EWw3ute349hSkYl0xBfXfoV50FjWAua2HlMIyJ3KTgbbOX+wgtm498sjtdDOUzq+UYTsQV67Mcg
 m2B/yjKfymi/KbyL6pfYhY9H4npAWkJWCsGoYLKkZOURZEDge63/JLpBW5eg7trnLzmnV5veRiY
 AuIQLWr+vZg8LAiCu9Rv898vcjlYF8FKAjq7OF1X4+17skQUP35KzvrL48kFYa/AW08Z6tNAqok
 mu79ZyrxhSCLNa9bXLDfvZkArTTTEmsEEAQjOfo5Zs5v2jN2omRv2dUMfs1YBr7PBPd+aPoJ7Eb
 GP8v75cOaB8Ry8WnlhUBT1MJbkJl6IrT369wIz28sSPqtCUaFkxdEMuyUWOSpEN4pjsPZBqe+Sr
 9Q7HguXp3iS+YYSoQhZAhxvH/VJ9ay8I3wFSAybGOBaMzD+j7RSWjTW6+ZCz9hrejF5HVyDDDDa
 f3vJhhsU96OubaHfsjA==
X-Proofpoint-ORIG-GUID: m0iQlgPkM6chbvZMw-6PsSF3bEUgBOg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230094

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> rproc_shutdown() rejects a remoteproc in RPROC_CRASHED state, and
> rproc_del() ignores that error. The result of these two decisions is
> that a user cannot stop a remoteproc that with recovery disabled that
> has entered a crash state, and removal of an associated remoteproc
> driver will release resources without first stopping the remoteproc.
> 
> Allow rproc_shutdown() to stop crashed processors. Propagate the crash
> state to subdevice teardown, to allow subdevices to dismantle things
> appropriately.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 5e6a0e05270e ("remoteproc: core: Move state checking to remoteproc_core")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
