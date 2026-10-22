Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665310;
	b=Goqgjbb8H4Gh9kxiArWruxoeok4tJTaKGJphaEY06nwAT9k/Ma5sZVZvnyPKsDauYrmJ
	 tDBbkQbyP9TvCRdTgPZMKMANGoHVJAs7IA/pkcnSOFwWhiCVBh/595tgdPMSkWXPdwCD/
	 NxVDMUReTJxMCp6xdWfmg/q7kYZ7De+smTFSjqp3WEesDPtfmU3bn/DTSYxj2f6XTZStN
	 wVY5PlfzZYvn3B0o10ePnIKrT8wzWVtCSGwAeRg6IBzW5A+LOYhPm9O1kxz/MnfA3CucQ
	 oq9nE+thRHS0AqrNQvqMRbceTfn8WUkdcj/tySvY4xZjml5eFW0fnyGKR/K9wW0DDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
	b=UxrwVZWazQ6Bnxk24Eb0HM2rpvfP5uu5fDukgqzifnmjBrgU0Iju0cT0o6jS8CJaJ3Kc
	 Chz8nHaWJMx90GU/ktH1+CLIwvXIZwUDJrTz7EV8+Abrler9ePAucGd2FF8B5puF6VwkP
	 /u+HXmV9amMwi8onrzyAhWLiaxnWLCnaUVP+pXcZg0u2NpHjKQFYM/wj2I6sBZZi+G7Rz
	 Sq9IzG9iTUmKz8+D0oRJbxu6L+D+9MaTaetFYDq06QAXrFsmxaKjrGm5fGXjEylKGv4Cy
	 hifuFQmBhMEe/RDpnf+3IvAxknTgq02nQnVxblJoRBhed1a9HJOjRgbjIrWk6mtWTCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5D606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xxB91962207
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvNhtW+cE5LosWrzD/zgIZov
	g0BXl55ZhyoehTHQpSo=; b=MQxmwBngqVbTJYlLbdUvA90EhU1KKM79Cd2glIXe
	QMQiRS4x39EmrguyvaR0esBDoSMGL2TfQ7LZgkW3zypA3KE27auAEN9J7Y7uLKZX
	zQLlVHHkzh4ewGKwhWsarL5JGM1TUeuPQD9Z1hAzUzaTcwPBeyHCVMKWKGZsc+zI
	sn0MeBmP9QTJHFKKxLCAqkqPHrsaba4zLvl4UIH1IkQuXQdF0pJWh4LQuFOhdseY
	ixK4sDi7S6vuOei2pGHpE3DYM4RsThz1MbnhBCfS/8gweaJga9TCbsAyxfuBLQCd
	YSibpRFb57K3bAMALFIvVf7fx6ErOiaH/lHQxoZUIeGBRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj431-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535066512b0so51711371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665308; x=1793270108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=Zk2VW3p1BeNTWhPd6BhapNRXYoixh8johClC3tUHaJGuyT6pSwHX/vIQHIeoYYhwxf
         QDrM/g+tAtt/o7eRk4Bb8dl7DxMTx0XJ3SSJyvsFEsxvCwfNTX7YHb53k4Xkd9PDEHz9
         ee5zhB4nB6x+Eo/Y1CvLsm/73GJ14GYpdyENYoqgVUVF/SSRWMX9Zb3VvKqGm9N8mauK
         icMRSP25jZZUeebH0i8W9CWOjHV5LW94Lru6zZk1+jo+RycRx77jqDHtSehA19zlgypL
         MkZCd4dfMhXOS4QvB0uUrXvp2RE2ZrYU4su4wBqlwdab7Il+ZuN09daKXNghtsJkw/6O
         XO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665308; x=1793270108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=shaBYvz9kVDhkftPrhbB17TdEh054oSF3lUW6vZiX9HLa3u4WnTIxjjY0ZgifxYvYc
         VVAVMHP/0GUHnBaYB+0moN5ELIfG4SjC3I1OdBKz+Jo0utCy7VQOal9TM9j7Ww4paSOa
         kti4T/05Vuf4z10ES8KtQmeaWrrs9tFYhQv5O6+ftiV2IzHWVLj/HurnnlOIJVHnRX6U
         /Mhrbk7o/VaX7DToVX1r1DZ/MegDyoetkGMkkm5XdtKxezVN250ojAvxVp6gtoG167hY
         YLFdjV6jZfbMmand03n1PCNiHpXXzk8vrnJXOa5wL+Nd1ozLaPr/MzMzkvA79iHcHbdv
         QwdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy+sZmLbB17e43c4tKXKEK/gLrx+NGoUkuiK7/XqtEVqb5M8578Fr3apEoRG3HUGs7K9WB9qbRszeua6jc@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6vYUHJTamSpJf1k2jv8taMRnMMR7p2eCswTb9jeyzcN84ABD4
	NaHqP+bdhec1f4IAOvB4LhDcG2CQE/D5I8ePhB8dIP2vbr/S/2iamXFq0A7BQuUJNouUiDRZxvZ
	98BysRVzurAqo9Fivw+ibPjKL5EJReZjOLPjMCqj+0fLYgnBJbKgEKOzPnM212IP4r+TX
X-Gm-Gg: AYBFou0AKKAHCBOe1HvDdhfG8ioJ5S/C5imPGi9lT/1EBs57K2gNp+6VxEoXlvLk/h6
	5wowQGW42e9KkZPYM/7f6CqocIg0L//FZEh2DkIgfZCjNWIDJY/ShvPrUX7e13fWBHnvIb4DvRN
	pBIuPoAosxf785z1kW96WdAge58svHMD+yhF3Jf3Cz6n4TEF3HEZJlL0xuhU5liiySXQIWlf9/U
	LP9UnXzRtDiW2QwTiKkloZoRd+M92v5FFftN52tM9wPu91+r0nrvRMB26MQkEkbbbIS41F54b+r
	svrMCKrjFAIzqwiqWcLqx0LTCn9Geg7lkwMQpZT89ENmbEwpZYrWwap6NkMN0ZJYW3k1oq7/yE1
	DgtaTcU9Ymn0alOZG+spyaJ4I1nyJoUBRhW2048Gq8mH3KhUis+HP2C5/1D7DxD+Yjrmrgf9qHi
	oxQy8kXJVge4k7
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858527885a.5.1792665308280;
        Thu, 22 Oct 2026 03:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858524685a.5.1792665307784;
        Thu, 22 Oct 2026 03:35:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11f5f30sm1036059e87.19.2026.10.22.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <teczcryolqo3rgo2jzeafrcd7iktpzx2johlvphb4cyvdd5dml@awmlmvzqm34u>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX+/PdN7eFVh42
 C03eX+UKWwhc6le7L9CU7qsBSkWVWT4dEA5KEqZbW7iSxAkYyJFe7iowSt1821slmjJhwSELAFU
 yLj5Uf7aekbNnbcVNoW9AX9ScW6Vhj6zo1PP9uuRt6B/th+iobAyX4OmTPAY9Jvh1+EKR/w6s9f
 uHmsYx22CcCVJE7q968nUTqXjGSLCHNw/ze5mJM7R5PN2saI8hYX/Nzk0Ewt/7UMDGNOVLFSc5I
 XDCdgbaR8c22Ft63tEYoFUps9/JJMceNcgpnaBaGbc6ESDadd+Ha8ZX2NsVeDG2ahRdajef9W5G
 RBKRkHF4EDgeuAk6K7LS6OUI55dheopLKWLzcnwdLZejwl3LBPoe8Ob/h/re2yA9xFHmbI2JyrL
 ii5AKhro59+usREPXaYCw8MrmhwcM36k+3tJc3scLzjU671ufyvnDNG1iCRvR9k2JHd1uHnU3iR
 Ks9VHYxhlKCU/ukcRiw==
X-Proofpoint-GUID: _VzjtmDwJlZTAbQm1wbwefL8izinDYkT
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9e6dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _VzjtmDwJlZTAbQm1wbwefL8izinDYkT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX2vSlV0JBvjLX
 kvXP2yfbaAOW7iJBsph/ba1RrApx15mq6ywlQYIhxI3b0j1w1tRstwbB1p7+lOGai20K/4AXG7O
 QC4kQ5Pfs1p9dkKoHGKdibzcYKun3K0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:24AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
