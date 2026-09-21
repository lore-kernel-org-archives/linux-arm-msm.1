Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9746D2A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997466; cv=none; b=LdTpkDgeSFMPirgpZc75OiG1yIZPbST5yVY6n7/WJlV+BT8JUmQmopG82J/g1zWNossH0sbITaGLtv8tVQI9DQIkuNeCHe57gJJ/UWSCzULmMqcxEp5o+pZ322vTafDgJyqBtcI61fQrRXRjblhZXWIjXkPqu4Mpk/6BqpAPYW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997466; c=relaxed/simple;
	bh=gd8sCEyaTAI7eMdD2HXKVF5GZpAOb71YcgaX0M7X6ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tX1MufQ94RV80z5Ft/YHrWyScEP6Up2bnmHyC0aoXRceUuTZdH0aFtqgcmK6jETL+zR6yGcJPYhPstL04qyxrCjG2x1UcSxlBEdYxwDU+KR7/o8++YW3S2nbQZ3LGAxXkow+shBragwso2PRTf1F333MJyw1myvdK55IAIvPDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTgBK4FW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4llPrdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTgBK4FW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4llPrdF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeLDL1219039
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3ORugXsYMCu8anseOiym52xhd2lPDBnueeArAPXAPk=; b=gTgBK4FWqTTyedEL
	RWOVjTGynMvHsZAkjh2Oo24HsGE/bMd0IP+2ZWf+bUr9VXeoz8UbrcpCKeLtwL1z
	PrymPnidCpPbhom8qP4tGhQ2cxElHCgH/x8Z8bXuw2bz4Zkldno80HiZypUtKJN5
	FIrLZPGpwd7kpPgk72kJWTKzWhBW44p1z3zZ7T3K+FGrtE9bKD1EoMU9JQEYzvvJ
	T9zEi0vFcEUCJ09Yn4WSKV3GQTa1x0JfWxrpFtGdGoU91ew0DiFR4c8XCdgras31
	2+F33bAYFBAzxbcxA/Dfk5qq8bRngKLsh3cEUJ7WTHpPgELdpycRKzoXsO+RIiVQ
	8NCNJg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119ft5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:31:03 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46ade2ed260so2067346fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997463; x=1790602263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3ORugXsYMCu8anseOiym52xhd2lPDBnueeArAPXAPk=;
        b=S4llPrdFBCDknJjZUY4lVuc1VBLvYJ9LetftWPhK0TefeKbcVxBJzYcaBHby+Zq47v
         +wvIsoVOXWz85cOMMUf7yfPRHP4WvzBNN7KIwVPPMSxLMDTSCrvmYBBReLTs6T0sxIlt
         ch75iXQ9oz3JcjAbw9g374RrwEQva9LXrSmcwtKf9giWEhpc6K3Z8bhuVWsx6fcm+NTo
         wrjjmigpkdZqBEyxoItiXTzDcZ4aX7ago0gJMTFMQsTkp1x84rfEEKdDFkWg3+hGwS8J
         eIcU0EdyP6GpJRJetJsJDzaBBbYHNvFTsUeEJZt8AMqtVNhB6lC20n58knxQX+25MUQr
         17GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997463; x=1790602263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3ORugXsYMCu8anseOiym52xhd2lPDBnueeArAPXAPk=;
        b=ZSPR0Sg/CnCOGk9VeXJXrdHI67uoxOkAs0uv7PFoKyTWolg6PRp0e4NY5wFRefKMCX
         rhABjXEkfz2FXKCdaqeqazka+pIyQv6EatGjpGUQCQp+NNLTeftqZhBlZM4ehRqFPvND
         ZWjMLs4IUUDigbryApSJozonkMexIdw3UIxUhqG/CN+ynSR8dv9DDv8bIywtYVfwvHwK
         BMUf8pmz/JZ966mrHIq5fd8q3kcoZR5LCBX+WwYm8ti2x+oZ1RYU/j9r3tq6Zbna6z/w
         csiMMMWQs16KJVQSxFVak1wQlzfnktT4W/0aWqhlvgRjX9YgCPQ6nyV9e/lTJK+c6AVF
         8cUw==
X-Forwarded-Encrypted: i=1; AKwUvBwPLi6imgq3EO6nxta68o2qx1BDBTQjYMUbyQZ5I6bb8ZTCdCrPuxBzMa7fB+FtV71iuERRk7KlZn/0Z+lX@vger.kernel.org
X-Gm-Message-State: AFuF++lipQMP38/hQdEJBpuyuSbRI3lPXuSVtmCu8ahA9e6BP4j+YG0Q
	Qyim41cI/1x6X4IvJ8phihKBP35WkS5YQNTEYs0+Unwx2PZLLP52ZNxABH8kNahMB8/EXL3jHCh
	hZIxFbbW+49Sg7Ngr3DZdyBGe42veH4iQboOUuW9Y1oNllfWfis+kqafzRBg/Gv/b2hPb
X-Gm-Gg: AYBFou35sbnvh9CXDQQ+lpfcb4sMR0fKxPWLC5vrfjihfrUBBSJf2ywkf1eE5fgeDMD
	RH1ndnGr5yWyk3FCTNJLx02gQlgDP4ZzqtQN2x6sJdLp1+UNJss+7G1nNhMfAmqECje6pElRDBB
	debRzVk8mh7wo5Bo3UZLAXidU0tsm0QirChnQruiRkWz9jrR7jeRnhn0xzKNsAIG7ycSc/MsRS+
	6AVWRx10tf7kJw21vwFNtRWFAXyUjwWwRCI8I9nUz3WdncKKy7oJ1gvbFZcCEn0WnUoicpKu6yJ
	sLp2gJStGf53f7NswjD5yfxZkAk9OA3O6H2tY8HptlI9MSqu5IoWetkvlKGUyyvPhSgmWnHUgRf
	lQdkjGPsor1Hg35h5aNLIlw==
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr7294784eaf.0.1789997462930;
        Mon, 21 Sep 2026 06:31:02 -0700 (PDT)
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr7294751eaf.0.1789997462507;
        Mon, 21 Sep 2026 06:31:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a837742bfsm69119166b.44.2026.09.21.06.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:31:01 -0700 (PDT)
Message-ID: <3b706a60-6903-4d75-bf60-8e2a95333dba@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] i2c: qcom-geni: Use device_set_node() helper
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260919141434.22999-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260919141434.22999-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: llF0P0Ovf86DRuH5yc99w-bH4Ak-hsGB
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab13197 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sjX4YLzMi0i6tBz261wA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX1/7Fu1ThOhkB
 OHT0v4XDBjI3Evt4Qr7uOhTxwlBkhjh3qxnEFskQocPAEoriqCkuIGuKxTkJeirl7yZH2LhWZSs
 MLmvNgNmEjKqpKip+PIA3db2ALgZGu5k/ROYftmy4yhQElragBQ6zRIkmabQTn76nu7fhJjbsFo
 9PdudDplcC/W+NEeq6toq0jaUixOKl4RzSxRSs4JDH+FUCNUSUeQiE3C+dUATMgGp6b8BbeILdb
 IsMiK8vn9CEjv/G7fa1c4aCawgNT8VYwqnzmFUo8HvjRvBlR0YUqx7NnDYZft3djzyvaJXNMnjH
 KDYdstmUBcrSID9jLwKCFR7Ls7NI8UBZmNaX3zHT2aoCTyOoBbEHQCWUDi7XbSzc1MJsVE41FTI
 hHnnTmoB823kvu23O2wO7R703KVTyf3+FqbQgkB1AkXsErvaNnmfIzM71pg6esBCLC6z6MAFol6
 vx3vfSKUUaC640yZEuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NiBTYWx0ZWRfX6xTgOcmD/oV0
 anao4pJbfcCCtUBe4eBgDth1MAjw2meCoqSVYkyTLufHkRVaVPRA8A+Lyb+AAQN5eozMl02ZytC
 r6FJLDmYvNCddbrQVrXYjovvhcQ3KHI=
X-Proofpoint-ORIG-GUID: llF0P0Ovf86DRuH5yc99w-bH4Ak-hsGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210196

On 9/19/26 4:14 PM, Hans de Goede wrote:
> Use the device_set_node() helper instead of manually setting
> adap.dev.of_node, this:
> 
> 1. Ensures that in if he parent has an of_node adap.dev.fwnode also
> gets set to point to the parent of_node, rather then leaving it NULL.
> 
> 2. Removes the need the specially handle the parent having an ACPI
> fwnode, since the generic helpers take care of this too.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
