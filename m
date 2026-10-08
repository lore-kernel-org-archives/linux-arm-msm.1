Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865B289E13
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439854; cv=none; b=GjCvo5l9u5frbA+k1fTuievPivTY0TfKD39c9ohcKsr9h0GcS7+J45EsPp6Zm/BsP4HCW+cyc0oEBuAtH8LmfzBrUyR0DJ+7TaT40rdTFq2TUOaNKaDVUO0LO5nrHFnfW7g5KL+Q2obl1OE9FZApI/CHEAOyFrhm9ZJa4N6nFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439854; c=relaxed/simple;
	bh=9sm8KXWdUgCKJZiCqooRJIQAmVgG+nvnpuC5U/+qK1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzt0BndXwp2owNbffkN9qvOn3WB+yHHE5wGZS3goyf24KaaL7WwMrRxmHWkJdx1QDBjVxjDNCC3b5cucjbam1cUu1eZJwwp4UCPL1SvtgmZRO91i51j61FZCmYJLCg+kMJL57P7lBnrSGGUB7AFJxpJUCofzyf0zSqx2zGEr+fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc4000Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnylA8Nq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc4000Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnylA8Nq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BfBG1776038
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=; b=Dc4000SimgsXN83I
	YITP31k18mKS8yvh2N0PkMiaGpEDdJ1SJkyWtWR8nd8dNsK08a+3gMNEiOkvWil+
	f4ghUYYHSZSMorWYDYWU8JFLvLgghY3cIyOyKguNn6rcz3Yn4Tjok5whiWbOjXgK
	H39+T5pc/gsps0BY71Vgfx8/2brr0pASt9UhMIwoE1GPgzE+RaYBSDajq2qrBMar
	jR7f8c46nQwVFeP773jhNDSL1xmLKrNZ4awcU+2uSweWbNuFELm494VU06PrkbIY
	nWzcf5O5T6yCObzS7izBeZhsxeUjQ/qExP79TwM8XwWujinvUluVIagcz+I2I3UU
	gbeEew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39bhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:10:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5815703a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439852; x=1792044652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=BnylA8NqaEw7UkkUMbXdxd73Pit2iQzmGI+eXxQTBaBMVn6dBhcDDFzA+RiurUosRQ
         i4b/aenH5k7L14n8i+wxv04HCyJkIFGRmeleN980aqV6qexKnXEQeRzPURy/yFDG3QL8
         CK1+TtXQa79TckXIGTl0DPCHCdm+5ypgejdwuJZVThfrF+vEu3n+bVyWJqndD9rNGL9S
         Et3waqXm9mj5yABB/jXFQAlOImtbNiTqPN6pR+Jo+nQulKbpaNSOND4zr0+QN6t9K11t
         M+fB/qp4V3/Doa0gie9Zphj+osq1gebmdUEOJBiRJlyBFoBtxr57DQgK3qkRDcB6jY/P
         RFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439852; x=1792044652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=fCkesD2XjYITB4d3rgcSXW/jm38bh2+m9s5Yh803kIKhJ07P5TndTEDkR3l++R1VAF
         IDhSREbAoy+227RCoVMyVqhzAYiU+FTMHCggmh57efbjvpukMAWZmJtOUumffoMLD8eO
         iogMP1zfinYkRLC+m9DIjeENB/J+ofur4B8KsLAvZhSuI3xVG8PFiNy5ObtoctKQN2oi
         QfHUh2/b8rJ1P7ZXjjxSPsnIQrzjvctWkEKRCg+4/V1hBx+ZxIVi9pY8ZtEldO++XtLq
         /urFlCMYqyblJe/OW9sZ8A8Z/UEOEvlMxxwge7cdjwN4NPzIjwh3aRIHEge7tRBrc45r
         MYEw==
X-Forwarded-Encrypted: i=1; AKwUvBxPbv3s0JF16mbds1Mm7FxRgDYjxuDpHAPW2MGRBRVXcGS8Z9LFGVZ2ykE4EIQZYkN33hx9HnuIliP/mS2p@vger.kernel.org
X-Gm-Message-State: AFq9FYIDR3QxTo77I/TSc7JH2b5tpGqKcshzMmy3btuJzkcnabBvaOXO
	Tc45jg0MubjKcj45oPA2CpyaQ9hnSGuFYAg47vyv75xDU55jttYDDAq8On+K0s4Q3aEeCAaXrlG
	z7/HYkJOxxYuhgJwfTI11rKIDeLr2M2Y0ovNedYxnk9S1Eojcn006c2rtB2AEO8xfy/Ve
X-Gm-Gg: AYBFou3W7ZnPkSxbowodplrzJ40zkji+DZxCDJO/hrn6d4QRTaxeMjpdtG8oiL+TrIS
	v0agokucAFoTl+zWBmygK3tX6Nb2Vrlgr8dN8gQBVhhs8psbIFyq+Es2m+2wZBZx0VQ8evw+URx
	7LlLBadx8TpnbliY8v1aqpCtgAcAiODESQhCAfVVc3SVmDNttMWazD/5YzyWIkCQ2MzPKVKWfBx
	Y/viYSpzj24tfDI+KQL0k1uZaeJRRdaloJzhz0hQ/U9APhsq6uGpHfMaE2fxIAp5heqoXEioCHz
	fpOxRKTFQycbh6XLgouEt7/G4RcuPqI9LMg1LGmwvHNJmQqd2JKFFONHWC0LgXtyqWoRAyknEEn
	gaHJ2FSpvyfQrVxnuXf+/41hQavoaNAk=
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492333a91.41.1791439852046;
        Wed, 07 Oct 2026 23:10:52 -0700 (PDT)
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492280a91.41.1791439850602;
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc6e23sm2785258a91.14.2026.10.07.23.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Message-ID: <f69b350a-63a6-4a66-afc7-8421ab86877b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac733ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QPSRtYdQVBWiSw6D44AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXxWBxngUeltAS
 G2/NyDk0Ji5iyFv1Ndy3NuJvCdqquYmRSAoW5MLqxQ2VZFPJR81c3tMx0A6Kan2mI0ukt8LxRJC
 L86Q7eU2L+lIfEtPz0SEheaqNu+EPQs=
X-Proofpoint-GUID: DegYaUOPLjjmOj7VNAIhqpm-Auos7zdt
X-Proofpoint-ORIG-GUID: DegYaUOPLjjmOj7VNAIhqpm-Auos7zdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXz4ssadi7eDHY
 V6MVUl260lQEY6d5Niwj22ApVHAgT93HbpE3lEF8l9XnQHNJ3iHStLMPgQCIuAdgKA0rhbDlz96
 yT2BaSw3KBLqQWSUybUv2gy+qaGEnegoaKWEF7CV0n6I1aTT/nKItkKklUbyewW2ryelU56p9eu
 HdOpPg5FynikCSsk1KxqFZUwUrAV0Ayj8VaBLsQp6O6kbd3Q971u3TAD5uAQB9eRSotaQcXYNsq
 oRNp5MKbCoy9/Lr5Ub40q2qanAx6/fulFBA8FPR/HEw5eX99Zjx3VYphZVZjrDKBwxfhm8df13i
 guSa+2SVOxbteLcsJqusSX8hcSW9KAx0mlG8xTV81+W+6Nb7b8oZoQ1Zzkp2x9zoOvvv37FWzlj
 BHnK1Bd7FYrevZeGuSE5XO7NDb5SE2nN113JGbAFVPFmFvsW+1PC3vyn/8Pj45VURLroYqiD0CF
 GzaszLC9C61ok9TOBFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.
ACK. will correct in next version.
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
