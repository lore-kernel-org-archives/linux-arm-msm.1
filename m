Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945F3E411B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102411; cv=none; b=W5KzBDoVTOL9Mbp2rMge6Zjeusa/TgamwgggPpSU0VtPxKWEwtCqVH7DyijN7i/SC83+2P3EWhSWUUItlchgVBja9cfdxWjK/APY0UIuQU3r1IMyAIrwlNvImTeognvl74zl2no90hFQjQHR2l+Qoxhi8raRmkAVV3EOJ2vMf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102411; c=relaxed/simple;
	bh=FPJqZBuwcaFSdiddtgAQazk7ObrgOAPJDTp4xRU4Z2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsQVF4D9debhNq3XWGbdzSYLWUfUhZrzB4xeaXk174wsM7OyFjgOh5vVKzvGmTp/in3BfHlWqApV3FbbL9xjFTRznK+bzvXWr3hCaTcWX6lNOdMt/NThYw2vuelLgOpS/SUiXNQfHS7NcuzJi5W5DjNZheUYpAyn6tgDokJyx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnC3O6Iq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5BA+bRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnC3O6Iq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5BA+bRo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4M9tl3055564
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+306gjzXhwMHAm1NfVhhtkws0kI/yH+Z9PbPFUn7Bs=; b=TnC3O6IqpCLH0IYw
	XKnK8fY77uWwx5EgI1+ksSz2DTkKHOjh3IgsIE2wp1a58/M8NKWRJyXIBYnB7loM
	KgnuD67H078iZYHLyHIjl3d0Zsw5PMaX8owbTcQmqzcjRoQ90aXE5uzX6a1B9D4d
	loC7M8oT+XGRTwdRc/ceyZxOQEjXDhDqeLF0Pke8yeC8qnM9a/yS+6GlDoAl7xJs
	rRHOGulJSiQpJf4vZql3lZa9rUVmqK6lSUVgwfUQrDZ8E8xkd7dktiMVVuGSZszg
	QDb46GHO2VV7M7CTdsaQAii7PECDxNK74N5YdmcjFL3njP6DkFLSS3/ytfEcNHjJ
	fEZORw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts3evq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:53:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-869c40637faso520139b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 21:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789102409; x=1789707209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+306gjzXhwMHAm1NfVhhtkws0kI/yH+Z9PbPFUn7Bs=;
        b=Q5BA+bRoAVvgtP0XzQ/K194qDLeNSEbcP4Vtj1pyvO5QPGpI46daDjZrw7J7zTUsIy
         TT3ygC0yx0z+iNFse79M3cOgHeao25zVUkaXbJBOY/lWArmrMonpc7oUhn4fPnVSWGH9
         rDJuUow72yO2SO6jy+/wrWHM72f/H2znpCfAQfAXpkbcJ/UYSR7TcCEQOdCRnAiU4tKP
         dTQITAQVUM0Wcmfd6XOfq0ng/BHNE9JN9TV8cY6c3qQB2RGe5TrhKshKpwWD8IkGhT20
         A9HFOthLRll5+2Nscq7+6S6g88Id1BLjHrOUfGuqJYmgShxMSZTjbKWTQO2j5f6ZbO4N
         Z0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102409; x=1789707209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+306gjzXhwMHAm1NfVhhtkws0kI/yH+Z9PbPFUn7Bs=;
        b=UF9PyShTaAtA++jdcvEOqKILv3+Kr6Me1Qm3NSlOVduFt9MRUdbXjiXbkGzQy4Y/a+
         SuEbXFcrxxyKE2gOE2COmCWpIB2JRxB2XQYyREPuaPzP/rjiuQCw4hhqwS0SQ54UlyjG
         PWGrl6iWg/0uvfm2xpivl9pUPtr3IMyQFgiQkXDLoRmohRsjRRwh6NNsSknoCP0ZP5VU
         Ha9DyF/GM1CloUg7RBY3uwI/ilAS16Vm3ZtD9eKuMp98EFpB1i9Cv7D3pliK7LzHyIsN
         uMvxB/+oHvMlUaJi0Sp1+bgqtimZQwkGBB3ggBZQXqnFS0WzuRdwdLnx7D52JNtvmg81
         pDcw==
X-Gm-Message-State: AFuF++nsIvP+AOEPjp313FkIcQHOUr2rdkc8Q+FKUpHqkdN2d6DpdXkQ
	p8ivKscoVujywilj7RhcSBBAiqn+jAWHpQv6Y49ZbWl75hiwoSz2rRG3kgAgzQN/+bQq2lFiQY+
	AKe3jVt90Y5KXt8lH0haZfccZoYoke84vyLmOGAIWzQKD5m9lsNL1+QoJK1X7WonG3qRhT4sFZd
	TN
X-Gm-Gg: AYBFou0aIxaok3yRdVZFPNRx8sLlzNEAyHMh2uOWiNapZpch85KP2EoZBl7k039ulXh
	CgxhIKZ7xzljyfmwEjsqAi+fCHrRIVz48xMismmdomB/lgSYMr8tIKYtnh2c3bl0/O5VByALiE7
	JYjvqSdqjEgr5LW0m4xAtDR+WMOggS94/NP3B96bimNtvQcLq/1bZNX+WWech9pOxGgcLy3gGCB
	RKoNWv9g/4ik1E/ldcldiR+n2l7zTGD3GzYGuadH9Djq8sZO/otp5dcu9k/IMzcsV/0NevXkYtb
	fQyW3C3+Jo1MjIiffdymxVCwYBPIxsufMKKpdWCKZElXuZkVn5A0seOxXGjUdulfYho5b6MF5iF
	MD8VtmwZBhEk/BEY/uFDQh+iu8U4Y2w==
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr3879732637.2.1789102408470;
        Thu, 10 Sep 2026 21:53:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr3879686637.2.1789102407960;
        Thu, 10 Sep 2026 21:53:27 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm5225620c88.12.2026.09.10.21.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:53:27 -0700 (PDT)
Message-ID: <f9a80dee-57ad-4854-b1a0-7d0891bfbf63@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:23:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
 <2d411e9c-709f-401d-9c94-3ed6a01fae35@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <2d411e9c-709f-401d-9c94-3ed6a01fae35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa38949 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NvrTDbujp6jT7j-8r4MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: zZbkIldC7_uC4KEDAW7ctDsWS7uzIcAN
X-Proofpoint-ORIG-GUID: zZbkIldC7_uC4KEDAW7ctDsWS7uzIcAN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA2NSBTYWx0ZWRfXxWmRIP2YAu5n
 AlXAzLn1wCmcmfX/dwjVEBoggp3K6zp+Ee6VyN4FSupsUKb1CSmeSeZAhSAvlaJP7T3n8o269Qi
 4I5CjC4cVi+JnyFSR/CpctvO3QrHh4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA2NSBTYWx0ZWRfXy3N+4RCOUoF2
 S7vPEkxpwYsmLxlkLZYqBiY5PhipqO2UXRxa/jM45ojWo+BCBOiNT5/lMjqBx6Aja/2U8ITd86C
 GpLTbpW5XxKkFvAQAqfq1Z3YYA21A+VXKF12/wHHnG+XWxvgu0p0DlV49n6V0qNx+ZUbeSft7J+
 gh4BQDZN8/DSvsCa6JoGt7LUJLBurX+AUic2mXyp22JSarVbT0wa+qR8sMnRu+paAsOt7dJbCvX
 bnYafewRMKzPmKQ64q9vx59p/jgXvOYJEGSDjG8x2nMhQkRwpI9Zh56tkuc4QM1MZqnU3k2QSC1
 lkddA8DAeQ4myijxYP5lojXoykhitxXnpVBV9HvoGVeOsHylga/u4l1NfTSfpvDXvhWXXWGC/O7
 LBErWBXiZqxRdqZNzehZFn+VJj3tfJmjZDXzjb4pIbhGhl7htSSdk4VqEc5m41DDY82rHk+Dj99
 mbV0sCzwTCWe3ql+WOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110065


On 10-09-2026 14:31, Konrad Dybcio wrote:
> On 9/10/26 10:53 AM, Maulik Shah wrote:
>> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
>> request instead of default 8 byte on older SoCs. The write request
>> continues to be 8 bytes.
>>
>> Update the read request message accordingly on RSC v4.5 and higher.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index c4542318eac4..f84a399fa5dc 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -86,6 +86,7 @@ enum {
>>  #define TCS_AMC_MODE_TRIGGER		BIT(24)
>>  
>>  /* TCS CMD register bit mask */
>> +#define CMD_MSGID_LEN_READ_v4_5		4
>>  #define CMD_MSGID_LEN			8
>>  #define CMD_MSGID_RESP_REQ		BIT(8)
>>  #define CMD_MSGID_WRITE			BIT(16)
>> @@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>>  			       const struct tcs_request *msg)
>>  {
>>  	u32 msgid;
>> -	u32 cmd_msgid = CMD_MSGID_LEN;
>> +	u32 cmd_msgid = 0;
>>  	u32 cmd_enable = 0;
>>  	struct tcs_cmd *cmd;
>>  	int i, j;
>>  
>>  	/* Convert all commands to RR when the request has wait_for_compl set */
>>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>> -	if (!msg->is_read)
>> -		cmd_msgid |= CMD_MSGID_WRITE;
>> +	if (!msg->is_read) {
> checking for the negative first is odd.. it's existing art, but
> let's invert that for readability

Ack. will update in v2.

>
>> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
>> +	} else {
>> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
> This check will fail for e.g. v5.0
>
> (major == 4 && minor >= 5) || major >= 5
>
> Konrad

Ack. will update in v2.

Thanks,
Maulik




