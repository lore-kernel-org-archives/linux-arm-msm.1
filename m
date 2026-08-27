Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438671E5B68
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803225; cv=pass; b=Vlds9qGwtVC5zxoXwxOvYybyEmE2Ka+kJKNiB/+iACAcLfi9m3xyB0SQxYBeA0QUC0gi7w3f7wHWDVAzZCfwt/Fp3QLEp+i/o+8vQDeZ7mekxiHr6O67qgNQcHhkJdOqcYfdeWlBXnB13exGJIcIYHrfAfLk/LmLnm2Kx50EVNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803225; c=relaxed/simple;
	bh=oxkYlzhhuag4na2JWsclWG8wKntLbGrO1jgX1/Z8KNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBu5Ajp6gPdo013BI3Q//QQ/yCxfBHhxeW+MYOUwxv7ybhUBMhJZt8Se5uE1H4BERpeJJiWFDNsUr3QZOrkTlupAdEzJyhjCpihPJJ/BovKLb2GF+yoUwb1JiFfesFOMy5BdQlg4lzOfjIUHCFpcuqv8sxDzaGqRwf7lYJpbA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzRmdEjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJGRTaY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzRmdEjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtJGRTaY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3IoYi3875064
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=; b=JzRmdEjSWbYhMJAP
	28tOehxuOJD3K4yGSPqxv0LdFqXkMtvZOB23dB/K31xMt7Pv2TA47vpzTgKU7Ezc
	Iq6OmQwp9PjkbDMIby8/ALPpdXBQcnMNalhZudHuzqKgu8Ui8z5zM5ddg5SR8pQg
	RbkP70O/dmvtcu7d/rTsRfVNmLDM6Xvu0v+iuhox2Q4LVtqpNB8QSfnzX+9Eph6t
	qWzBN4p26S2PvFR08DOH96lKGIwfx0XaRrAM+GEfapQN1G1W7n3915+/rEt36x+K
	vqwfehXcuXONIixlxDzuliiaizOLU7Y6R026AVEcSeggZogs1wHXx1ADTOIleidu
	a/zAvw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5gvp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c70f4b830so554613d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 21:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787803222; cv=none;
        d=google.com; s=arc-20260327;
        b=YzXTDaRj1FnA6WbInVO0RHHXpkKyxpS2qGBsrqW/wYZxUadNu6mQcbkxvBRI5KY1KH
         m25zxDoU0kO67s0p2z3ozjc9wjhb2s/f8zt2O6fclGvsRXwpKaq7nN0kJwqgSQ9ZzhTm
         CoYfQAZPDE7rRNJtOdQVXmyUsxRcQRRifL3h+5Zcb+yn+wcC7MU3ZBxMJ8lU+4+y/zK5
         WQwuMIaifIVxQ6RfwDWs6WkS6+qMCLfPsevOiqW1PFdYb5k/MjOCjyxfiSSpHx0tbLLu
         0oTdCNNcQk4Ro+LNFZii6x4aMUfoXy4AqukYtTc2/HSN3crgLqssuE0VkDzoOzc3qXZa
         abMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        fh=CYwgPuNWoi6mQo1ebRpekKWJIab2q6S2tXt86Lm1LbQ=;
        b=kJoOEvhyBsOYggP/z7bgcBvufBtaNSYKZMfrI/lN31qpjuAxiYItqSZo1zLoU4vKED
         KXjxCDL079nMVAOT//YKXsApazptW8WvzJw7WF31DPtfQL5x+0277Uwx9bjdmzP0LRAw
         u5IHI+YGxg7QnnngvHJWO7+RBE3Nj1eRaPha36mkm49tAYyzddthacsTrtXCfVkZJKJl
         q4/+N9MmvvsMnUCbDSTtxCTRwvUzritXlpgT/s8naPGPmLR+dqqykav+8+k7RgRjRZX5
         y7Hdg0Lcl8uYZlz4gikvoVZlyMGfU6GjxuR9qF/PMzGDQaQ3OY54dxNKZSdR8V/wgsva
         5n6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787803222; x=1788408022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=RtJGRTaYBa+MHc5N6c8i8KAzGCcr5ETGlzt6HAAdv8F2BBXRvJP30gLixJ4+AlEpDZ
         NUI3ZPbP8HjslKYvBxlVhQdGUSccx3NOwXgQU/iw4HLcsUA0+hrE+L5Y33EvgGRWTyxk
         S39SQb9xakqaN5JwLEox+ZM9RYoUsN7XDCokZmjJtwmWqrwyPdR3Yhj4alvAbF8v2ddI
         uObet1B5ehVSCdUFv9Nuk4BLo5IQP/9ZFlhMx3iEbQw0DBOTEIyEGqI4aHbt3e2thklT
         1y64b83UOuhzBIau8n3PKLUYlMPDE0OvYxGuubcnlDGmslhEh7qX0/TnqfJrfDyJb4jI
         ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803222; x=1788408022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=hBIbSNWB1K1KF4af7badRWw4hG5mTnFPBsg15sJGLVUPvAdTQybsNFYvdrg+Op40dy
         2SG2vkJ0pDEq1YDSJj+edPWP+Um2dI/mdg8uBWg853TAU+63hcMlgyR/Hp1jmph8sxFe
         vbxrDUoiEQLGsJRA3XERrMGm+IX01Dt6JinNhDI8NdENvYWFzbVYJw9cDvOHJKSGxiqF
         4gUh7tpZdYKyMv2l4ZQRcuCa2802xbPjYli4gS0s+G1WwAOdsxsQk3NIoMfwEZhxaSne
         2RHOIf4dMpSTReojnAxN74Qj7/str1BDOusKKgWdUyHuM3mreNuaD+QP0bbEbnLO5w6P
         NaPw==
X-Forwarded-Encrypted: i=1; AHgh+RrGM/DVqFHmu8C4CYWNiuSnZpaEgJakbcXcMRSRoD9RKp+cJeBMYrTeQmhKeejOty1pbP8MImvbMRidrshM@vger.kernel.org
X-Gm-Message-State: AFuF++net3jNpOEbTibbDYkbRfUkwyLdU6+JpjLq/AQBvL74uQ/sZLGx
	5329YzKrj4jZLpRid3AN6NZUgK9Rchv/oitRQS1oFoPIs1lXw1guVv1jCalXPf8ewCopny9XYmn
	Bgkf1vX0MlSSgOmpqg89rWx51iAVqQ7fApF7myw4im9XdTgiD3FIKvY27OQ+bG48wcGjV0Y/i5n
	SHxJzYUDKXYCf3Z86/FHqCNs6qPf1eqM2H63lRFg4fcTyYzTMLR3E=
X-Gm-Gg: AR+sD11chJ6EplDrTGmYynfh+bdE0ld0/TYFuCTnuNRn3atIPksEH4FM5/HPcymzfnP
	ypbYI0PkA/4aj05R0WVAYCbnEOl7Vl5yKuArxtHrAYgc/QtiaglgIVNUNgO4aEyq/8mwQYgKpeV
	EPVZ4cYOcwcbcF8NX7ZRCJUQZ4yCIKmL/lLR8ZakGE7JnuNORsroFYOw8EOw==
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id 956f58d0204a3-66d257eba9amr3248394d50.48.1787803222435;
        Wed, 26 Aug 2026 21:00:22 -0700 (PDT)
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id
 956f58d0204a3-66d257eba9amr3248376d50.48.1787803222014; Wed, 26 Aug 2026
 21:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
In-Reply-To: <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:30:13 +0530
X-Gm-Features: AcwNN1VxELkZrglEk7cAJOduQPXP1zIrNjAfvcnJwAH-yznopOZrFR-Fw-ookJg
Message-ID: <CAC-tS8AfsCT+CY44EDQ17NUkhuPX8xT1tA=Soi+UwP6+HRoupQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Mark Brown <broonie@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xpDKeM9XLFcCNgi5GENijMfqR6wm7E3B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX4fvrHOKIkEBv
 KEds/vNnkJNdRI8tPt7Lqfe6wKri8L/WzZZFlq+UabnhEkSJBM+Sj8Tn8YzMqMw5tTLmmoiMaO5
 SrrZV1qkan8rVIbHLQXKC3EjlYmoZ/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfXz7Of47NVpCoP
 SRD7vY4zPT1vHQKnQjBLV+IyBghlQ0KVShtJZ14szfF2I20lO1wKv6PcsCYdsJiA1m9ZM7r0dVr
 BHv72adOv29blLf1vKmrOUkunZZ28alcBOxibM4Yfm8oeqjbmVuM7asjXVdtHul8RI3ZlFFXEVb
 zgN6txiDWgLi68IKAeN1pu1pbNcUWSu2RuspqH+h9iHQoHEPpD895GPYADolTgepQ7MQ/vogaFQ
 4T4Xg2+fkciuI8WLXxnGPmuYdXgXmnYGya0On1hZdlwX4vdwxCiHUkMzPadYafOkmnRJqTvB7oa
 twY772sLLJmf/HEWio6M7e0bgztFNdGZ7Szz07hvxFOON8QjJDWkoOXVq3lvb2Au026Cp2YP1X6
 43WCiGuUIwscwzp5Q+5sKfL4cUlHc/epUfGSZOHn07Pd7/VXB8PBJFx6awBDfiOqvGUnMXgfRwQ
 5FMiqjCjLxSDQnGYfoQ==
X-Proofpoint-GUID: xpDKeM9XLFcCNgi5GENijMfqR6wm7E3B
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8fb657 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=5jftPqpqXhJRGXY4JksA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270029

On Thu, Aug 27, 2026 at 5:02=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 26, 2026 at 02:01:52PM +0530, Mohammad Rafi Shaik wrote:
> >
> >
> > On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > > interfaces and the internal Bolero/WCD codec. Platform Devicetree fil=
es
> > > need a binding to describe the controller resources, DAI cells and pe=
r-
> > > interface AIF configuration, and named constants to avoid raw numeric=
 IDs
> > > in sound-dai references and child-node reg values.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
Thanks for your suggestion, Will keep it in mind next time.
-Harendra
